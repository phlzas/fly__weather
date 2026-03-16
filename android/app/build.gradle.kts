plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.fly_weather"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.fly_weather"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            // Signing with debug keys for now so `flutter build apk --release` works
            signingConfig = signingConfigs.getByName("debug")
            // Optional: shrinkResources true // uncomment if you want
            // Optional: minifyEnabled true   // uncomment if you want
        }
        debug {
            // Debug build type
        }
    }
}

flutter {
    source = "../.."
}
