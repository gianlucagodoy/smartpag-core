// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.

class DefaultFirebaseOptionsHml {
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
    apiKey: 'AIzaSyCez5_IW8oIH_HAsw0A71Iz0NHWR1iMRDo',
    appId: '1:916769283604:android:28ad6752ddfb3d470c9101',
    messagingSenderId: '916769283604',
    projectId: 'Smartpay-65fed',
    storageBucket: 'Smartpay-65fed.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCIfnDb0zZS9n-oUPbPA007yCQ-mcKvA24',
    appId: '1:514593935912:ios:15cf13fb2e6c7dcab41b1d',
    messagingSenderId: '514593935912',
    projectId: 'appcliente-dev',
    storageBucket: 'appcliente-dev.appspot.com',
    iosClientId:
        '514593935912-hgmqtpr262aptrfvup7526b83083j8c9.apps.googleusercontent.com',
    iosBundleId: 'com.Smart.Smartmobile.hml',
  );
}
