import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBoi_LSH3-y10YJgBRXGoUWpm0woPbt9p8',
    appId: '1:472092144970:web:9f5234f912f6e34820fdb3',
    messagingSenderId: '472092144970',
    projectId: 'connecta-b8335',
    authDomain: 'connecta-b8335.firebaseapp.com',
    storageBucket: 'connecta-b8335.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCaSBtWnTkOa-XukG3a6bP9SgPxsR2XKnw',
    appId: '1:472092144970:android:5066dff9d89a0d5820fdb3',
    messagingSenderId: '472092144970',
    projectId: 'connecta-b8335',
    storageBucket: 'connecta-b8335.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgXLwXOdT_SWeJ58Kg1bqsC0k9TwKZwl4',
    appId: '1:472092144970:ios:6d7f1bad8122cb5c20fdb3',
    messagingSenderId: '472092144970',
    projectId: 'connecta-b8335',
    storageBucket: 'connecta-b8335.appspot.com',
    iosClientId: '472092144970-1d4nncld3u885622lvhs9mcml8ti2kcv.apps.googleusercontent.com',
    iosBundleId: 'com.creativepeople.connectaApp',
  );
}
