package com.example.myapplication

import android.content.ContentValues.TAG
import android.os.Bundle
import android.util.Log
import androidx.activity.ComponentActivity



class MainActivity:ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        logd("In main activity : onCreate")
    }

    override fun onStart() {
        super.onStart()
        logd("In main activity : onStart")
    }

    override fun onResume() {
        super.onResume()
        logd("In main activity : onResume")
    }

    override fun onPause() {
        super.onPause()
        logd("In main activity : onPause")
    }

    override fun onStop() {
        super.onStop()
        logd("In main activity : onStop")
    }

    override fun onRestart() {
        super.onRestart()
        logd("In main activity : onRestart")
    }

    override fun onDestroy() {
        super.onDestroy()
        logd("In main activity : onDestroy")
    }
}