package okhttp.builder;


import android.content.Context;
import android.os.Build;
import android.text.TextUtils;
import android.util.Log;

import com.example.shiku_flutter.BuildConfig;
import com.example.shiku_flutter.helper.LoginSecureHelper;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

import androidx.annotation.NonNull;
import androidx.annotation.WorkerThread;
import okhttp.HttpUtils;
import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

import static com.example.shiku_flutter.AppConfig.TAG;

/**
 * @author Administrator
 * @time 2017/3/30 0:14
 * @des ${TODO}
 */

public abstract class BaseBuilder {

    @NonNull
    protected final Map<String, String> params = new LinkedHashMap<>();
    protected String url;
    protected Object tag;
    protected Request build;

    protected String getUserAgent() {
        StringBuilder result = new StringBuilder(64);
        result.append("shiku_im/");
        result.append(BuildConfig.VERSION_NAME); // such as 1.1.0
        result.append(" (Linux; U; Android ");

        String version = Build.VERSION.RELEASE; // "1.0" or "3.4b5"
        result.append(version.length() > 0 ? version : "1.0");

        // add the model for the release build
        if ("REL".equals(Build.VERSION.CODENAME)) {
            String model = Build.MODEL;
            if (model.length() > 0) {
                result.append("; ");
                result.append(model);
            }
        }
        String id = Build.ID; // "MASTER" or "M4-rc20"
        if (id.length() > 0) {
            result.append(" Build/");
            result.append(id);
        }
        result.append(")");
        return result.toString();
    }

    public abstract BaseBuilder url(String url);

    public abstract BaseBuilder tag(Object tag);

    public BaseCall build(Context ctx) {
        return build(true, ctx);
    }

    /**
     * 是否需要添加验参，
     *
     * @param mac 是否添加验参，
     */
    public BaseCall build(boolean mac, Context ctx) {
        return build(mac, false, ctx);
    }

    /**
     * @param mac         是否添加验参，
     * @param beforeLogin 是否强制按登录前接口添加验参，true无视accessToken按登录前添加验参，false表示登录后添加验参，
     */
    public BaseCall build(boolean mac, Boolean beforeLogin, Context ctx) {
        String language = Locale.getDefault().getLanguage();
        if (TextUtils.equals(language.toLowerCase(), "tw")) {// 繁体服务端要求传big5
            language = "big5";
        }
        params("language", language);
        if (mac) {
            addMac(beforeLogin, ctx);
        }
        return abstractBuild();
    }

    public String buildURL(boolean mac, Boolean beforeLogin, Context ctx) {
        String language = Locale.getDefault().getLanguage();
        if (TextUtils.equals(language.toLowerCase(), "tw")) {// 繁体服务端要求传big5
            language = "big5";
        }
        params("language", language);
        if (mac) {
            addMac(beforeLogin, ctx);
        }
        return abstractBuildURL();
    }

    public abstract BaseCall abstractBuild();

    public abstract String abstractBuildURL();

    public abstract BaseBuilder params(String k, String v);

    /**
     * 给所有接口调添加Mac,
     */
    public BaseBuilder addMac(Boolean beforeLogin, Context ctx) {
        LoginSecureHelper.generateHttpParam(ctx, params, beforeLogin);
        return this;
    }

    public class BaseCall {
        public void execute(Callback callback) {
            OkHttpClient mOkHttpClient = HttpUtils.getInstance().getOkHttpClient();
            mOkHttpClient.newCall(build).enqueue(callback);
        }

        /**
         * 当前线程同步执行http调用，
         * 用以实现一些场景一个线程调用多次http请求，
         * 因此该方法不能在主线程调用，
         */
        @WorkerThread
        public void executeSync(Callback callback) {
            OkHttpClient mOkHttpClient = HttpUtils.getInstance().getOkHttpClient();
            Call call = mOkHttpClient.newCall(build);
            try {
                Response response = call.execute();
                Log.d("响应回调::", response.message());
                callback.onResponse(call, response);
            } catch (IOException e) {
                callback.onFailure(call, e);
            }
        }
    }
}
