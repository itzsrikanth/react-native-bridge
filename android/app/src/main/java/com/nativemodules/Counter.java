package com.nativemodules;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import android.net.wifi.WifiManager;
import android.content.Context;

public class Counter extends ReactContextBaseJavaModule {
    private static Integer count = 0;
    private static WifiManager wifiManager;
    private static Boolean wifiState = true;
    public Counter(ReactApplicationContext reactContext) {
        super(reactContext);
        wifiManager = (WifiManager) getReactApplicationContext().getApplicationContext().getSystemService(Context.WIFI_SERVICE);
    }
    @ReactMethod public void increment() {
        count++;
        wifiManager.setWifiEnabled(wifiState);
        wifiState = !wifiState;
        System.out.println(count);
    }
    @ReactMethod public void getCount(Callback successCallback) {
        successCallback.invoke(null, count);
    }
    @Override public String getName() {
        return "Counter";
    }
}
