package com.example.shiku_flutter.xmpp.listener;

public interface ChatReceiptListener {

    void onReceiveReceipt(int state, String messageId);
}
