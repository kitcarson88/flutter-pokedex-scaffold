package com.example.pokedex_scaffold

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine 
import com.example.pokedex_scaffold.FlutterEngineConfigurator

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        FlutterEngineConfigurator.configure(context, flutterEngine)
    }
}
