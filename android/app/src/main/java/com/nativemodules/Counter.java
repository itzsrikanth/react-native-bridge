package com.nativemodules;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;

public class Counter extends ReactContextBaseJavaModule {
    private static Integer count = 0;
    public Counter(ReactApplicationContext reactContext) {
        super(reactContext);
    }
    @ReactMethod public void increment() {
        count++;
        System.out.println(count);
    }
    @ReactMethod public void getCount(Callback successCallback) {
        successCallback.invoke(null, count);
    }
    @Override public String getName() {
        return "Counter";
    }
}
