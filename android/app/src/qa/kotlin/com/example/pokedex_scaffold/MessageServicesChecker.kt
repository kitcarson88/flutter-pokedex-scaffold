package com.example.pokedex_scaffold

import android.content.Context
import com.google.android.gms.common.ConnectionResult
import com.google.android.gms.common.GoogleApiAvailability

object MessageServicesChecker {
    fun isGMS(context: Context): Boolean {
        val result = GoogleApiAvailability.getInstance().isGooglePlayServicesAvailable(context)
        return result == ConnectionResult.SUCCESS
    }

    fun isHMS(context: Context): Boolean {
        return false
    }
}