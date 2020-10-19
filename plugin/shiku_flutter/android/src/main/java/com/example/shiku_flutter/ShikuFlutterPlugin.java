package com.example.shiku_flutter;

import android.content.Context;
import android.os.Build;
import android.os.StrictMode;
import android.text.TextUtils;
import android.util.Log;
import android.widget.Toast;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.shiku_flutter.bean.LoginRegisterResult;
import com.example.shiku_flutter.helper.LoginSecureHelper;
import com.example.shiku_flutter.util.Base64;
import com.example.shiku_flutter.util.DeviceInfoUtil;
import com.example.shiku_flutter.util.secure.AES;
import com.example.shiku_flutter.util.secure.LoginPassword;
import com.example.shiku_flutter.util.secure.MAC;
import com.example.shiku_flutter.util.secure.MD5;
import com.example.shiku_flutter.util.secure.Parameter;
import com.example.shiku_flutter.util.secure.RSA;

import org.bouncycastle.asn1.pkcs.EncryptedData;

import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import okhttp.HttpUtils;
import okhttp.callback.BaseCallback;
import okhttp.result.ObjectResult;
import okhttp3.Call;

import static com.example.shiku_flutter.AppConfig.TAG;
import static com.example.shiku_flutter.util.secure.Parameter.joinSortedMap;

/**
 * ShikuFlutterPlugin
 */
public class ShikuFlutterPlugin implements FlutterPlugin, MethodCallHandler {
    final Context ctx;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        final MethodChannel channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "shiku_flutter");
        channel.setMethodCallHandler(new ShikuFlutterPlugin(flutterPluginBinding.getApplicationContext()));
    }

    public ShikuFlutterPlugin(Context context) {
        this.ctx = context;
    }

    public ShikuFlutterPlugin() {
        this.ctx = null;
    }

    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "shiku_flutter");
        channel.setMethodCallHandler(new ShikuFlutterPlugin(registrar.context()));
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("getPlatformVersion")) {
            result.success("Android " + Build.VERSION.RELEASE);
        } else if (call.method.equals("toast")) {
            String text = call.argument("text");
            Toast.makeText(ctx, text, Toast.LENGTH_SHORT).show();
            result.success("显示成功: " + "Toast:" + text);
        } else if (call.method.equals("loginMethod")) {
            String encryptedCode = call.argument("encryptedCode");
            String encryptedPrivateKey = call.argument("encryptedPrivateKey");
            String loginPassword = call.argument("loginPassword");
            String userId = call.argument("userId");
            result.success(loginMethod(encryptedCode, encryptedPrivateKey, loginPassword, userId));
        } else if (call.method.equals("MacEncodeBase64")) {
            String text = call.argument("text");
            String loginPasswordMd5 = call.argument("loginPasswordMd5");
            result.success(MAC.encodeBase64((text).getBytes(), loginPasswordMd5));
        } else if (call.method.equals("LoginMd5")) {
            String loginPassword = call.argument("loginPassword");
            byte[] key = LoginPassword.encode(loginPassword);
            result.success(LoginPassword.md5(key));
        } else if (call.method.equals("base64Decode")) {
            String value = call.argument("value");
            result.success(Base64.decode(value));
        } else if (call.method.equals("aesEncryptBase64")) {
            String passWord = call.argument("passWord");
            String encryptedCode = call.argument("encryptedCode");
            String privateKeyStr = call.argument("privateKeyStr");
            byte[] code;
            byte[] privateKey =
                    AES.privateKeyAES(privateKeyStr, passWord);
            //////////////////
            try {
                code = RSA.decryptFromBase64(encryptedCode, privateKey);
            } catch (Exception e) {
                result.error("login failed. ", "私钥解密code失败", "test");
                return;
            }
            // ==============
            String userId = call.argument("userId");
//            String salt = call.argument("salt");

            byte[] key = LoginPassword.encode(passWord);
            String loginPasswordMd5 = LoginPassword.md5(key);
            Log.d(TAG, "loginPasswordMd5:" + loginPasswordMd5);

            String salt = createSalt();

            Map<String, String> params = new HashMap<>();
            params.put("xmppVersion", "1");
            // 附加信息+
            params.put("model", DeviceInfoUtil.getModel());
            params.put("osVersion", DeviceInfoUtil.getOsVersion());
            params.put("serial", DeviceInfoUtil.getDeviceId(ctx));

            String mac = MAC.encodeBase64((AppConfig.apiKey + userId + Parameter.joinValues(params) + salt + loginPasswordMd5).getBytes(), code);
            JSONObject json = new JSONObject();
            json.putAll(params);
            json.put("mac", mac);

            String data = AES.encryptBase64(json.toJSONString(), code);
            result.success(data);
        } else if (call.method.equals("singleAESEncryptBase64")) {
            String text = call.argument("text");
            String apiKey = call.argument("apiKey");

            assert apiKey != null;
            byte[] code = MD5.encrypt(apiKey);

            assert text != null;
            String data = AES.encryptBase64(text, code);
            result.success(data);
        }  else if (call.method.equals("decodeLoginResult")) {
            String data = call.argument("data");
            String code = call.argument("code");
            boolean isRegister = call.argument("isRegister");
            byte[] enCode;
            byte[] privateKey;

            if (isRegister) {
                enCode = MD5.encrypt(code);
            } else {
                String loginPassword = call.argument("loginPassword");
                String encryptedCode = call.argument("encryptedCode");
                byte[] pwKey = LoginPassword.encode(loginPassword);
                try {
                    privateKey = AES.decryptFromBase64(code, pwKey);
                } catch (Exception e) {
                    // 解密失败，登录密码错误，
                    Log.e(TAG, "解密失败");
                    return;
                }
                try {
                    enCode = RSA.decryptFromBase64(encryptedCode, privateKey);
                } catch (Exception e) {
                    Log.i(TAG, "私钥解密code失败", e);
                    return;
                }
            }
            String realData = decodeLoginResult(enCode, data);
            result.success(realData);
        } else if (call.method.equals("generateBeforeLoginParamSpecial")) {
            Map<String, String> params = call.argument("params");
            String userId = call.argument("userId");
            String accessToken = call.argument("accessToken");
            String httpKey = call.argument("httpKey");
            String salt = createSalt();

            params.remove("access_token");
            String macContent = AppConfig.apiKey + userId + accessToken + Parameter.joinValues(params) + salt;
            String mac = MAC.encodeBase64(macContent.getBytes(), Base64.decode(httpKey));
            params.put("access_token", accessToken);
            params.put("salt", salt);
            params.put("secret", mac);

            result.success(params);
        } else {
            result.notImplemented();
        }
    }

    @NonNull
    private static String createSalt() {
        return String.valueOf(System.currentTimeMillis());
    }

    private static String decodeLoginResult(byte[] code, String data) {
        try {
            String ret = AES.decryptStringFromBase64(data, code);
            com.sk.weichat.util.LogUtils.log("HTTP", "login data: " + ret);
            return ret;
        } catch (Exception e) {
            Reporter.post("登录结果解密失败", e);
            return data;
        }
    }

    /*
     * 1。登录码
     * 2。私钥
     * */
    private String loginMethod(String encryptedCode, String encryptedPrivateKey, String loginPassword, String userId) {
        byte[] key = LoginPassword.encode(loginPassword);
        byte[] privateKey;
        try {
            privateKey = AES.decryptFromBase64(encryptedPrivateKey, key);
        } catch (Exception e) {
            return "解密失败，登录密码错误，";
        }
        /// ===========默认params
        HashMap<String, String> params = new HashMap<>();
        params.put("xmppVersion", "1");
        // 附加信息
        params.put("model", DeviceInfoUtil.getModel());
        params.put("osVersion", DeviceInfoUtil.getOsVersion());
        params.put("serial", DeviceInfoUtil.getDeviceId(ctx));
        /// ===========正式代码
        byte[] code;
        try {
            code = RSA.decryptFromBase64(encryptedCode, privateKey);
        } catch (Exception e) {
            Log.i(TAG, "私钥解密code失败", e);
            return "私钥解密code失败";
        }
        String loginPasswordMd5 = LoginPassword.md5(key);
        String salt = createSalt();
        String mac = MAC.encodeBase64((AppConfig.apiKey + userId + Parameter.joinValues(params) + salt + loginPasswordMd5).getBytes(), code);
        JSONObject json = new JSONObject();
        json.putAll(params);
        json.put("mac", mac);
        String data = AES.encryptBase64(json.toJSONString(), code);
        Map<String, String> p = new HashMap<>();
        p.put("data", data);
        p.put("userId", userId);
        p.put("salt", salt);

        final String url = "http://120.25.249.32:8092/user/login/v1";

        return login(ctx, url, code, p);
    }


    private static String login(Context ctx, String url, byte[] code, Map<String, String> p) {
        p.put("deviceId", "android");

        String urlResult = HttpUtils.get().url(url)
                .params(p)
                .buildURL(true, true, ctx);

        return urlResult;
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    }

}
