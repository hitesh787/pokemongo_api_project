import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    // http.Response? response;
    // if (image != null) {
    // response = await http.get(Uri.parse(image));
    // }
    return const NotificationDetails(
        android: AndroidNotificationDetails(
          "channelId",
          "channelName",
          importance: Importance.max,
          // styleInformation: image == null ? null : BigPictureStyleInformation(
          // ByteArrayAndroidBitmap.fromBase64String(base64Encode(response!.bodyBytes)),
          // largeIcon: ByteArrayAndroidBitmap.fromBase64String(base64Encode(response.bodyBytes)),
          // )
        ),
        iOS: DarwinNotificationDetails(
          badgeNumber: 2,
          presentAlert: true,
        ));
  }

  static Future init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = DarwinInitializationSettings();
    const settings = InitializationSettings(android: android, iOS: iOS);
    _notifications.initialize(settings,
        onDidReceiveNotificationResponse: (payload) {
          handleMessage();

    });
  }

  static void handleMessage(){



  }

  /*onDidReceiveLocalNotification(BuildContext context,
    int id, String title, String body, String payload) async {
  // display a dialog with the notification details, tap ok to go to another page
  showDialog(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text('Ok'),
          onPressed: () async {


          },
        )
      ],
    ),
  );
}
*/
  static Future showNotification(RemoteMessage message) async {
    Map<String, dynamic> data = message.data;
    // List<String> splitText = data["body"].toString().split("&=");
    // log("******************* DATA !!!!!!! ${jsonEncode(data)}");

    int id = 0;
    return await _notifications.show(
        id,
        message.notification!.title,
        message.notification!
            .body /*splitText.first == "Image" ? "Image : " : splitText.last*/,
        await _notificationDetails(
            /*image: splitText.first == "Text" ? null : splitText.last*/),
        payload: data['notification'].toString());
  }
}
