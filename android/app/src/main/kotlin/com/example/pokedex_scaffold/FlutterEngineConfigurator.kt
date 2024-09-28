package com.example.pokedex_scaffold

import android.content.Context
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.example.pokedex_scaffold.MessageServicesChecker

object FlutterEngineConfigurator {
    private const val MSC_CHANNEL = "message_services_checker"

    fun configure(context: Context, flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, MSC_CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "isGMS" -> {
                        try {
                            result.success(MessageServicesChecker.isGMS(context));
                        } catch(exception: IllegalStateException) {
                            exception.message?.let { result.error(it, it, it) };
                        }
                    }
                    "isHMS" -> {
                        try {
                            result.success(MessageServicesChecker.isHMS(context));
                        } catch(exception: IllegalStateException) {
                            exception.message?.let { result.error(it, it, it) };
                        }
                    }
                    else -> {
                        result.notImplemented()
                    }
                }
            }
    }
}