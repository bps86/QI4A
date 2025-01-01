plugins {
    alias(libs.plugins.android.application)
}

android {
    signingConfigs {
        create("release") {
        }
    }
    namespace = "com.n0n3m4.Q4A"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.n0n3m4.Q4A"
        minSdk = 30
        targetSdk = 34
        versionCode = 1
        versionName = "1.1.0"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
        ndk {
            abiFilters += listOf("x86")
        }

    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
    externalNativeBuild {
//        cmake {
//            path = file("src/main/cpp/CMakeLists.txt")
//            version = "3.22.1"
//        }
        ndkBuild {
            path = file("src/main/jni/Android.mk")
        }
        ndkVersion = "26.1.10909125"
    }
    buildFeatures {
        viewBinding = true
    }
}

dependencies {

    implementation(libs.appcompat)
    implementation(libs.material)
    implementation(libs.constraintlayout)
    implementation(files("/home/eleven/AndroidStudioProjects/Q3E/q3e/build/outputs/aar/q3e-debug.aar"))
    testImplementation(libs.junit)
    androidTestImplementation(libs.ext.junit)
    androidTestImplementation(libs.espresso.core)
}