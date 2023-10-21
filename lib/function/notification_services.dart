import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationServices {
//
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//
//   /// Initialise Notification Function
//   Future initialiseNotification() async {
//
//     AndroidInitializationSettings androidInitializationSettings = const AndroidInitializationSettings("@mipmap/ic_launcher");
//
//     InitializationSettings initializationSettings = InitializationSettings(android: androidInitializationSettings);
//
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,onDidReceiveBackgroundNotificationResponse: (payload){});
//
//   }
//
//
//   void firebaseInit() {
//     FirebaseMessaging.onMessage.listen((message) {
//       debugPrint(message.notification!.title.toString());
//       debugPrint(message.notification!.body.toString());
//       sendNotification(message);
//     });
//   }
//
//
//   /// Schedule Notification Function
//   // void scheduleNotification(String title, String body) async {
//   //
//   //   AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
//   //     "channelId",
//   //     "channelName",
//   //     importance: Importance.max,
//   //     priority: Priority.max,
//   //   );
//   //
//   //   NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
//   //
//   //   await flutterLocalNotificationsPlugin.periodicallyShow(
//   //     0,
//   //     title,
//   //     body,
//   //     RepeatInterval.everyMinute,
//   //     notificationDetails,
//   //   );
//   // }
//
//
//   /// Send Notification Function
//   Future<void> sendNotification(RemoteMessage message) async {
//
//
//     AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
//       "channelId",
//       "channelName",
//       importance: Importance.high,
//       priority: Priority.high,
//       ticker: 'ticker',
//     );
//
//     NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
//
//     Future.delayed(Duration.zero, () {
//       flutterLocalNotificationsPlugin.show(
//         0,
//         message.notification!.title.toString(),
//         message.notification!.body.toString(),
//         notificationDetails,
//
//       );
//     });
//   }
//
//
//   /// request notification
//   Future<void> requestPermissionNotification() async {
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: true,
//       criticalAlert: true,
//       provisional: true,
//       sound: true,
//     );
//
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       debugPrint("Permission Granted for user");
//     } else {
//       debugPrint("Permission denied for user");
//     }
//   }
//
//   /// Get token
//   Future<String> getToken() async {
//     String? token = await messaging.getToken();
//     return token!;
//   }
//
//
// }

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokemongo_api_project/model/message_screen.dart';

class NotificationServices {
  ///initialising firebase message plugin
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  ///initialising firebase message plugin
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


  ///function to initialise flutter local notification plugin to show notifications for android when app is active
  void initLocalNotifications(BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse: (payload) {
      // handle interaction when app is active for android
      handleMessage(context, message);
    });
  }


  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;

      debugPrint("notifications title:${notification!.title}");
      debugPrint("notifications body:${notification.body}");
      debugPrint('count:${android!.count}');
      debugPrint('data:${message.data.toString()}');

      if (Platform.isIOS) {
        forGroundMessage();
      }

      if (Platform.isAndroid) {
        initLocalNotifications(context, message);
        showNotification(message);
      }

    });
  }

  /// request  notification
  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('user granted permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('user granted provisional permission');
      }
    } else {
      //appsetting.AppSettings.openNotificationSettings();
      if (kDebugMode) {
        print('user denied permission');
      }
    }
  }


  /// function to show visible notification when app is active
  Future<void> showNotification(RemoteMessage message) async {

    AndroidNotificationChannel channel = AndroidNotificationChannel(
      message.notification!.android!.channelId.toString(),
      message.notification!.android!.channelId.toString(),
      importance: Importance.max,
    );

    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
            channel.id.toString(), channel.name.toString(),
            channelDescription: 'your channel description',
            importance: Importance.high,
            priority: Priority.high,
            ticker: 'ticker');

    const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
            presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails, iOS: darwinNotificationDetails);

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        notificationDetails,
      );
    });
  }


  /// function to get device token on which we will send the notifications
  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }


  /// function to get device token and refresh token
  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      if (kDebugMode) {
        print('refresh');
      }
    });
  }

  ///handle tap on notification when app is in background or terminated
  Future<void> setupInteractMessage(BuildContext context) async {
    /// when app is terminated
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }

    ///when app is background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });

  }

  /// Show message Screen For notification
  void handleMessage(BuildContext context, RemoteMessage message) {
    if (message.data['type'] == 'msj') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MessageScreen(
            name: message.data['name'],
          ),
        ),
      );
    }
  }


  /// Ios notification
  Future forGroundMessage() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

}
