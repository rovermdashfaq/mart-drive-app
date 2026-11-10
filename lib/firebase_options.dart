// Shared with MART Drive web app (https://mart-drive.vercel.app/)
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError('Platform not supported.');
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDUcT6hVqLHy3pYzwg1oktI7amTpF9Qj4c',
    appId: '1:829348083361:web:d6e91ccec70c2b9d53e2e0',
    messagingSenderId: '829348083361',
    projectId: 'mart-drive',
    authDomain: 'mart-drive.firebaseapp.com',
    storageBucket: 'mart-drive.firebasestorage.app',
    measurementId: 'G-J2ERB07TW0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUcT6hVqLHy3pYzwg1oktI7amTpF9Qj4c',
    appId: '1:829348083361:android:e1a90c0ef34b12c8a9d53e',
    messagingSenderId: '829348083361',
    projectId: 'mart-drive',
    storageBucket: 'mart-drive.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUcT6hVqLHy3pYzwg1oktI7amTpF9Qj4c',
    appId: '1:829348083361:ios:b91c1d8820c75a4ea9d53e',
    messagingSenderId: '829348083361',
    projectId: 'mart-drive',
    storageBucket: 'mart-drive.firebasestorage.app',
    iosBundleId: 'com.mart.drive',
  );
}