package com.example.shiku_flutter.socket.msg;

import com.alibaba.fastjson.JSON;

/**
 * @author lidaye
 */
public class PingMessage extends AbstractMessage {

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }
}
