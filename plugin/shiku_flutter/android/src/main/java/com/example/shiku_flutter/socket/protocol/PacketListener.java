package com.example.shiku_flutter.socket.protocol;

public interface PacketListener {
    void onAfterSent(Packet packet, boolean isSentSuccess) throws Exception;
}
