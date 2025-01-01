package com.n0n3m4.q3e;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.TextView;

import com.n0n3m4.q3e.databinding.ActivityMainBinding;

public class MainActivity extends AppCompatActivity {

    // Used to load the 'q3e' library on application startup.
    static {
        System.loadLibrary("q3e");
    }

    private ActivityMainBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        // Example of a call to a native method
        TextView tv = binding.sampleText;
        tv.setText(stringFromJNI());
    }

    /**
     * A native method that is implemented by the 'q3e' native library,
     * which is packaged with this application.
     */
    public native String stringFromJNI();
}