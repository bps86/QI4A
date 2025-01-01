package com.n0n3m4.Q4A;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.TextView;

import com.n0n3m4.Q4A.databinding.ActivityMainBinding;

public class MainActivity extends AppCompatActivity {

    // Used to load the 'Q4A' library on application startup.
    static {
        System.loadLibrary("Q4A");
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
     * A native method that is implemented by the 'Q4A' native library,
     * which is packaged with this application.
     */
    public native String stringFromJNI();
}