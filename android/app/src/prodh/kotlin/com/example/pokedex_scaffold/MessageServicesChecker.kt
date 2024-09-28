package com.example.pokedex_scaffold

import android.content.Context
import com.huawei.hms.api.ConnectionResult
import com.huawei.hms.api.HuaweiApiAvailability

object MessageServicesChecker {
    fun isGMS(context: Context): Boolean {
        return false
    }

    fun isHMS(context: Context): Boolean {
        val result = HuaweiApiAvailability.getInstance().isHuaweiMobileServicesAvailable(context)
        return result == ConnectionResult.SUCCESS
    }
}