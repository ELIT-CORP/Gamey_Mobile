// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB2ypU1hJoQKd3IXRSmBAu8vlra8sAnpHc',
    appId: '1:244783056436:android:ce14a002e0483568f6ec61',
    messagingSenderId: '244783056436',
    projectId: 'gamey-d8c1f',
    databaseURL: 'https://gamey-d8c1f-default-rtdb.firebaseio.com',
    storageBucket: 'gamey-d8c1f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAnEC29MYqVwDMLg0bIp01o361vyjyZqvk',
    appId: '1:244783056436:ios:32fa7a809f2cb8f9f6ec61',
    messagingSenderId: '244783056436',
    projectId: 'gamey-d8c1f',
    databaseURL: 'https://gamey-d8c1f-default-rtdb.firebaseio.com',
    storageBucket: 'gamey-d8c1f.appspot.com',
    iosClientId: '244783056436-s5p9n45e5tk2kfb8bqjssdb2erjvbjg7.apps.googleusercontent.com',
    iosBundleId: 'com.example.gameyFlutter',
  );
}
