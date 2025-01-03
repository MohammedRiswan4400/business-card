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
    apiKey: 'AIzaSyBQrCsaKHbuggxna970st-Mzjus0jSna_Y',
    appId: '1:1051564140085:web:52294344d506a7093fb37c',
    messagingSenderId: '1051564140085',
    projectId: 'bil-mt',
    authDomain: 'bil-mt.firebaseapp.com',
    storageBucket: 'bil-mt.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBGOfPOwjKnCSml5J4DFn6PyYC0B8VvBxY',
    appId: '1:1051564140085:android:c51686b5ceedcb633fb37c',
    messagingSenderId: '1051564140085',
    projectId: 'bil-mt',
    storageBucket: 'bil-mt.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBa4N6wD7fN6VIKS8bC4AAIHz2BpGq4wFs',
    appId: '1:1051564140085:ios:02d1d1a7a6c001df3fb37c',
    messagingSenderId: '1051564140085',
    projectId: 'bil-mt',
    storageBucket: 'bil-mt.firebasestorage.app',
    iosBundleId: 'com.example.fluxMvp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBa4N6wD7fN6VIKS8bC4AAIHz2BpGq4wFs',
    appId: '1:1051564140085:ios:02d1d1a7a6c001df3fb37c',
    messagingSenderId: '1051564140085',
    projectId: 'bil-mt',
    storageBucket: 'bil-mt.firebasestorage.app',
    iosBundleId: 'com.example.fluxMvp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBQrCsaKHbuggxna970st-Mzjus0jSna_Y',
    appId: '1:1051564140085:web:f2fac108b41b319b3fb37c',
    messagingSenderId: '1051564140085',
    projectId: 'bil-mt',
    authDomain: 'bil-mt.firebaseapp.com',
    storageBucket: 'bil-mt.firebasestorage.app',
  );
}
