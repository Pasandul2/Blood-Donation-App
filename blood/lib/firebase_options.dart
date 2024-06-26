// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(

    apiKey: 'AIzaSyCNQp4gM2CulKLySalmBQSE-wRpjlUkcH4',
    appId: '1:676532935433:web:26d4d7bfdb074e1466d1d8',
    messagingSenderId: '676532935433',
    projectId: 'blood-wave-cc13f',
    authDomain: 'blood-wave-cc13f.firebaseapp.com',
    storageBucket: 'blood-wave-cc13f.appspot.com',
    measurementId: 'G-ENY33MMCXJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDtGqgRGdKYN8BM193kUW3pgy8E0SL2PJ0',
    appId: '1:676532935433:android:54b9e1240b5e229366d1d8',
    messagingSenderId: '676532935433',
    projectId: 'blood-wave-cc13f',
    storageBucket: 'blood-wave-cc13f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCiMjPOtHwPpZiJKFF3veJafjZ41Nq6Cm0',
    appId: '1:676532935433:ios:65d1345267b7706166d1d8',
    messagingSenderId: '676532935433',
    projectId: 'blood-wave-cc13f',
    storageBucket: 'blood-wave-cc13f.appspot.com',

    iosBundleId: 'com.example.blood',
  );

  static const FirebaseOptions macos = FirebaseOptions(

    apiKey: 'AIzaSyCiMjPOtHwPpZiJKFF3veJafjZ41Nq6Cm0',
    appId: '1:676532935433:ios:65d1345267b7706166d1d8',
    messagingSenderId: '676532935433',
    projectId: 'blood-wave-cc13f',
    storageBucket: 'blood-wave-cc13f.appspot.com',

    iosBundleId: 'com.example.blood',
  );

  static const FirebaseOptions windows = FirebaseOptions(

    apiKey: 'AIzaSyCNQp4gM2CulKLySalmBQSE-wRpjlUkcH4',
    appId: '1:676532935433:web:0174cfcc51bae96466d1d8',
    messagingSenderId: '676532935433',
    projectId: 'blood-wave-cc13f',
    authDomain: 'blood-wave-cc13f.firebaseapp.com',
    storageBucket: 'blood-wave-cc13f.appspot.com',
    measurementId: 'G-4343J4ZH4Y',

  );
}
