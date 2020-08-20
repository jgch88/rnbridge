package com.rnbridge;

import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableArray;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.bridge.WritableNativeArray;
import com.facebook.react.bridge.WritableNativeMap;

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

    @ReactMethod
    public void capitaliseUserNames(ReadableMap user, Promise promise) {
        String firstNameKey = "firstName";
        String lastNameKey = "lastName";

        if (!user.hasKey(firstNameKey) || !user.hasKey(lastNameKey)) {
            promise.reject("missingKeys", "firstName and lastName must be present on user");
            return;
        }

        WritableMap result = new WritableNativeMap();
        result.putString(firstNameKey, user.getString(firstNameKey).toUpperCase());
        result.putString(lastNameKey, user.getString(lastNameKey).toUpperCase());
        promise.resolve(result);
    }
}