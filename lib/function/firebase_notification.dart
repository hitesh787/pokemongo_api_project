import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:pokemongo_api_project/function/local_notification.dart';

final callSetup = <String, dynamic>{
  'ios': {
    'appName': 'CallKeepDemo',
  },
  'android': {
    'alertTitle': 'Permissions required',
    'alertDescription': 'This application needs to access your phone accounts',
    'cancelButton': 'Cancel',
    'okButton': 'ok',
    // Required to get audio in background when using Android 11
    'foregroundService': {
      'channelId': 'com.company.my',
      'channelName': 'Foreground service for my app',
      'notificationTitle': 'My app is running on background',
      'notificationIcon': 'mipmap/ic_notification_launcher',
    },
  },
};

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("************************${message.notification!.body.toString()}");
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // print("Background");
  // print("Background");
}



class FirebaseNotification {

  static init() {
    FirebaseMessaging.instance.requestPermission(alert: true, sound: true, provisional: true);

    FirebaseMessaging.instance.getToken().then((value) => print(value));

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        //   print("ON App Open");
        //   print("ON App Open");
        //   Map<String,dynamic> data = message.data;
        // print("ON APP OPEN !!!!!!!!!!!!! $data");
        // ChatServices().chatNavigate(data['notification']);
        LocalNotification.showNotification(message);
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // message.data;
      print("*************** ${message.data.toString()}");

      // RemoteNotification? notification = message.notification;
      // AndroidNotification? android = message.notification?.android;
      // print("APPLE MANGO");
      // print("APPLE MANGO");
      LocalNotification.showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // print("On APP OPEN");
      // print("On APP OPEN");
      // print("On APP OPEN");
      // print("On APP OPEN");
      // print("On APP OPEN");
      // Map<String,dynamic> data = message.data;
      ///when click on notification and enter in app through notification we don't need this show notification callback.
      // LocalNotification.showNotification(message);
    });
  }
}
