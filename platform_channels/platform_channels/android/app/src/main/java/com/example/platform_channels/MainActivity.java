package com.example.platform_channels;

import android.Manifest;
import android.content.pm.PackageManager;
import android.os.BatteryManager;

import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;

import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationServices;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private static final String METHOD_BATTERY = "getBatteryLevel";
    private static final String CHANNEL_BATTERY = "android/battery";

    private static final String METHOD_CURRENT_LOCATION = "getCurrentLocation";
    private static final String CHANNEL_LOCATION = "android/location";
    private FusedLocationProviderClient fusedLocationProviderClient;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        fusedLocationProviderClient = LocationServices.getFusedLocationProviderClient(this);

        new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL_LOCATION)
                .setMethodCallHandler(
                        ((call, result) -> {
                            if (METHOD_CURRENT_LOCATION.equals(call.method)) {
                                getCurrentLocation(result);
                            }
                        })
                );

        new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL_BATTERY)
                .setMethodCallHandler(
                        (call, result) -> {
                            if (METHOD_BATTERY.equals(call.method)) {
                                BatteryManager manager = (BatteryManager) getSystemService(BATTERY_SERVICE);
                                int battery = manager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
                                result.success(battery);
                            }
                            result.notImplemented();
                        }
                );
    }

    private void getCurrentLocation(MethodChannel.Result result) {

        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            fusedLocationProviderClient.getLastLocation()
                    .addOnSuccessListener(this, location -> {
                        if (location != null) {
                            String res = "(" + location.getLatitude() + "," +
                                    location.getLongitude() + ")";
                            result.success(res);
                        }
                    });
            return;
        }

    }
}
