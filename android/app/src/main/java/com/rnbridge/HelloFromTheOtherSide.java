package com.rnbridge;

import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.WritableArray;
import com.facebook.react.bridge.WritableNativeArray;

public class HelloFromTheOtherSide extends ReactContextBaseJavaModule {
    HelloFromTheOtherSide(ReactApplicationContext context) {
        super(context);
    }

    @Override
    public String getName() {
        return "HelloFromTheOtherSide";
    }

    @ReactMethod
    public void greet(String name, Promise promise) {
        promise.resolve("Hello " + name);
    }

    @ReactMethod
    public void generateNames(Integer numberOfNames, Promise promise) {
        String name = "Justin";
        WritableArray result = new WritableNativeArray();
        for (int i = 0; i < numberOfNames; i++) {
            result.pushString(name);
        }
        promise.resolve(result);
    }
}