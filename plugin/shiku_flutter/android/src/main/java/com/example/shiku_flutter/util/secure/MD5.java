package com.example.shiku_flutter.util.secure;


import com.example.shiku_flutter.Reporter;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import androidx.annotation.NonNull;

@SuppressWarnings({"WeakerAccess", "unused"})
public class MD5 {
    @NonNull
    public static byte[] encrypt(byte[] inStr) {
        MessageDigest md;
        try {
            md = MessageDigest.getInstance("MD5");
            md.update(inStr);
            return md.digest();
        } catch (NoSuchAlgorithmException e) {
            // MD5不可能不支持，
            Reporter.unreachable(e);
            throw new RuntimeException(e);
        }
    }

    @NonNull
    public static byte[] encrypt(String in) {
        return (encrypt(in.getBytes()));
    }

    @NonNull
    public static String encryptHex(String in) {
        return HEX.encode(encrypt(in));
    }

    @NonNull
    public static String encryptHex(byte[] in) {
        return HEX.encode(encrypt(in));
    }

}
