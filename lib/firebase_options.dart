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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDB71EvCxrVSPL9MCHfweapFjUfUtE81gY',
    appId: '1:375124032133:web:0463dd9afbc272f1ff07ec',
    messagingSenderId: '375124032133',
    projectId: 'memoapp-b1af3',
    authDomain: 'memoapp-b1af3.firebaseapp.com',
    storageBucket: 'memoapp-b1af3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-51y1B_clmYkszjuf13PLaP6SOsgUcUM',
    appId: '1:375124032133:android:23cd4ba1baf43616ff07ec',
    messagingSenderId: '375124032133',
    projectId: 'memoapp-b1af3',
    storageBucket: 'memoapp-b1af3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDG-vdNqRzW7kCKSXvVoA_xrdE9_P-BNgo',
    appId: '1:375124032133:ios:72809f1512f07382ff07ec',
    messagingSenderId: '375124032133',
    projectId: 'memoapp-b1af3',
    storageBucket: 'memoapp-b1af3.appspot.com',
    iosBundleId: 'com.example.memoapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDG-vdNqRzW7kCKSXvVoA_xrdE9_P-BNgo',
    appId: '1:375124032133:ios:48290b1c51437b56ff07ec',
    messagingSenderId: '375124032133',
    projectId: 'memoapp-b1af3',
    storageBucket: 'memoapp-b1af3.appspot.com',
    iosBundleId: 'com.example.memoapp.RunnerTests',
  );
}
