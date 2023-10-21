import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pokemongo_api_project/api_services/user_provider.dart';
import 'package:pokemongo_api_project/cricket_app/ui/cricket_screen.dart';
import 'package:pokemongo_api_project/function/firebase_notification.dart';
import 'package:pokemongo_api_project/function/local_notification.dart';
import 'package:pokemongo_api_project/function/notification_services.dart';
import 'package:http/http.dart' as http;
import 'package:pokemongo_api_project/gst_screen/gst_screen.dart';
import 'package:pokemongo_api_project/model/other_model/user_model_2.dart';
import 'package:pokemongo_api_project/movie_app/movie_screen.dart';
import 'package:provider/provider.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // await FirebaseNotification.init();
  // await LocalNotification.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'white rose',
        themeMode: ThemeMode.system,
        home: GstCalculatorApp(),
      ),
    );
  }
}

class Product{
  String name;
  double price;
  String quantity;

  Product({required this.name,required this.price,required this.quantity});
}


/// Firebase notification permission
class FirebaseNotificationWidget extends StatefulWidget {
  const FirebaseNotificationWidget({super.key});

  @override
  State<FirebaseNotificationWidget> createState() =>
      _FirebaseNotificationWidgetState();
}

class _FirebaseNotificationWidgetState
    extends State<FirebaseNotificationWidget> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.forGroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken().then((value) {
      debugPrint('device token');
      debugPrint(value);
    });
  }

  List<Product> product = [
    Product(name: "name 1", price: 20.5, quantity: "quantity 1"),
    Product(name: "name 2", price: 40.5, quantity: "quantity 2"),
    Product(name: "name 3", price: 60.5, quantity: "quantity 3"),

  ];

  List<ProfileModelCustom> data = [
    ProfileModelCustom(
        name: "Hitesh",
        email: "Hitesh.com",
        id: 1,
        phone: "1234567890",
        username: "Hitesh",
        website: "Hitesh.com"),
    ProfileModelCustom(
        name: "Rahul",
        email: "Rahul.com",
        id: 2,
        phone: "1234567890",
        username: "Rahul",
        website: "Rahul.com"),
    ProfileModelCustom(
        name: "Bhavna",
        email: "Bhavna.com",
        id: 3,
        phone: "1234567890",
        username: "Bhavna",
        website: "Bhavna.com"),
    ProfileModelCustom(
        name: "Rawal",
        email: "rawal.com",
        id: 4,
        phone: "1234567890",
        username: "Rawal",
        website: "Rawal.com"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Notification")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: () {
                notificationServices.getDeviceToken().then((value) async {
                  var data = {
                    'to':
                        "eTr5R3pkTouRZfZaIxUTdX:APA91bFF3bSnPTt8QeFlIMoNNmKVzITa_qIBvpUUUbgGS1p_dv2W2qQ2Oo63m_kL_9ip9FeJi1buENjlarnCoaWxPgWs_ogeBPTpq-5a7JtJz5HaCzilM5ex6fUhXfPflYfjSj4JbxM1",
                    'notification': {
                      'title': 'White Rose',
                      'body': 'Follow me on instagram'
                    },
                    'android': {
                      'notification': {
                        'notification_count': 23,
                      },
                    },
                    'data': {'type': 'msj', 'name': 'White Rose'}
                  };

                  await http.post(
                      Uri.parse('https://fcm.googleapis.com/fcm/send'),
                      body: jsonEncode(data),
                      headers: {
                        'Content-Type': 'application/json; charset=UTF-8',
                        'Authorization':
                            "key=AAAAdd4BRvI:APA91bFvbe6SaiJPJabcJ7--m4k2QkE8tF5DWOANw18DT2S8_6oyebU32G8wHKF5arG5IywTWzbxgBYYmdeEUpUd7SJTeX2-NM87wysLtGIE7wxztx9dqBzDFEhNAXFgTCKHEBZJbm6F"
                      }).then((value) {
                    debugPrint(value.body.toString());
                  }).onError((error, stackTrace) {
                    print(error);
                  });
                });
              },
              child: const Text(
                "Send Notification for other user",
                style: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                  itemCount: product.length,
                  itemBuilder: (context,index){
                return Container(
                  margin: const EdgeInsets.all(10),
                  // padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.30),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(product[index].name),
                        subtitle: Text(product[index].quantity),
                        trailing: Text('${product[index].price} ₹'),
                      )
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}



/// Permission Code
class PermissionHandlerApp extends StatefulWidget {
  const PermissionHandlerApp({super.key});

  @override
  State<PermissionHandlerApp> createState() => _PermissionHandlerAppState();
}

class _PermissionHandlerAppState extends State<PermissionHandlerApp> {
  @override
  Widget build(BuildContext context) {
    final messanger = ScaffoldMessenger.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Permission Handler App',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.purple,
        child: SingleChildScrollView(
          child: Column(
            children: const [
              UserAccountsDrawerHeader(
                accountName: Text("White Rose"),
                accountEmail: Text("whiterose@gmail.com"),
                currentAccountPicture:
                    CircleAvatar(backgroundColor: Colors.black),
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Camera Permission
            ElevatedButton.icon(
                icon: const Icon(Icons.camera),
                label: const Text('Camera Permission'),
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  fixedSize: const MaterialStatePropertyAll(Size(250, 40)),
                  backgroundColor: const MaterialStatePropertyAll(Colors.red),
                ),
                onPressed: () async {
                  PermissionStatus status = await Permission.camera.request();
                  if (status == PermissionStatus.granted) {
                    debugPrint('Permission Granted');
                  }
                  if (status == PermissionStatus.denied) {
                    debugPrint('Permission Denied');
                    messanger.showSnackBar(SnackBar(
                      content: const Text('Cannot Access Camera'),
                      action: SnackBarAction(
                          label: 'Open App Settings',
                          onPressed: () {
                            openAppSettings();
                          }),
                    ));
                  }
                  if (status == PermissionStatus.limited) {
                    debugPrint('Permission is Limited');
                  }
                  if (status == PermissionStatus.restricted) {
                    debugPrint('Permission is Restricted');
                    messanger.showSnackBar(SnackBar(
                      content: const Text('Allow us to use Camera'),
                      action: SnackBarAction(
                          label: 'Open App Settings',
                          onPressed: () {
                            openAppSettings();
                          }),
                    ));
                  }
                  if (status == PermissionStatus.permanentlyDenied) {
                    debugPrint('Permission is Permanently Denied');
                    messanger.showSnackBar(SnackBar(
                      content: const Text('Cannot use Camera'),
                      action: SnackBarAction(
                          label: 'Open App Settings',
                          onPressed: () {
                            openAppSettings();
                          }),
                    ));
                  }
                }),

            /// Image Permission
            ElevatedButton.icon(
                icon: const Icon(Icons.image),
                label: const Text('Image Permission'),
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  fixedSize: const MaterialStatePropertyAll(Size(250, 40)),
                  backgroundColor: const MaterialStatePropertyAll(Colors.teal),
                ),
                onPressed: () async {
                  PermissionStatus status = await Permission.storage.request();
                  if (status == PermissionStatus.granted) {
                    debugPrint('Permission Granted');
                  }
                  if (status == PermissionStatus.denied) {
                    debugPrint('Permission Denied');
                    messanger.showSnackBar(SnackBar(
                      content: const Text('Cannot Access Storage'),
                      action: SnackBarAction(
                          label: 'Open App Settings',
                          onPressed: () {
                            openAppSettings();
                          }),
                    ));
                  }
                  if (status == PermissionStatus.limited) {
                    debugPrint('Permission is Limited');
                  }
                  if (status == PermissionStatus.restricted) {
                    debugPrint('Permission is Restricted');
                    messanger.showSnackBar(SnackBar(
                      content: const Text('Allow us to use Photo'),
                      action: SnackBarAction(
                          label: 'Open App Settings',
                          onPressed: () {
                            openAppSettings();
                          }),
                    ));
                  }
                  if (status == PermissionStatus.permanentlyDenied) {
                    debugPrint('Permission is Permanently Denied');
                    messanger.showSnackBar(SnackBar(
                      content: const Text('Cannot use Photo'),
                      action: SnackBarAction(
                          label: 'Open App Settings',
                          onPressed: () {
                            openAppSettings();
                          }),
                    ));
                  }
                }),

            /// Multiple Permission
            ElevatedButton.icon(
                icon: const Icon(Icons.my_library_add_rounded),
                label: const Text('Multiple Permission'),
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  fixedSize: const MaterialStatePropertyAll(Size(250, 40)),
                  //  ww: 200,
                  backgroundColor: const MaterialStatePropertyAll(Colors.blue),
                ),
                onPressed: () async {
                  Map<Permission, PermissionStatus> multiplestatus =
                      await [Permission.camera, Permission.storage].request();
                  if (multiplestatus[Permission.camera]!.isGranted) {
                    debugPrint('Camera Permission is Granted');
                  }
                  if (multiplestatus[Permission.camera]!.isDenied) {
                    debugPrint('Permission Denied');
                    messanger.showSnackBar(SnackBar(
                      content: const Text('Cannot Access Camera'),
                      action: SnackBarAction(
                          label: 'Open App Settings',
                          onPressed: () {
                            openAppSettings();
                          }),
                    ));
                  }
                  if (multiplestatus[Permission.camera]!.isPermanentlyDenied) {
                    debugPrint('Permission is permanently denied');
                    messanger.showSnackBar(SnackBar(
                      content: const Text('Cannot Access Camera'),
                      action: SnackBarAction(
                          label: 'Open App Settings',
                          onPressed: () {
                            openAppSettings();
                          }),
                    ));
                  }
                  if (multiplestatus[Permission.storage]!.isGranted) {
                    debugPrint('Photo Permission is Granted');
                  }
                  if (multiplestatus[Permission.storage]!.isDenied) {
                    debugPrint('Permission Denied');
                    messanger.showSnackBar(SnackBar(
                      content: const Text('Cannot Access Photo'),
                      action: SnackBarAction(
                          label: 'Open App Settings',
                          onPressed: () {
                            openAppSettings();
                          }),
                    ));
                  }
                  if (multiplestatus[Permission.storage]!.isPermanentlyDenied) {
                    debugPrint('Permission is permanently denied');
                    messanger.showSnackBar(SnackBar(
                      content: const Text('Cannot Access Photo'),
                      action: SnackBarAction(
                          label: 'Open App Settings',
                          onPressed: () {
                            openAppSettings();
                          }),
                    ));
                  }
                })
          ],
        ),
      ),
    );
  }
}




/// Internet Connectivity And Local Notification
class InternetConnectivityWidget extends StatefulWidget {
  const InternetConnectivityWidget({super.key});

  @override
  State<InternetConnectivityWidget> createState() =>
      _InternetConnectivityWidgetState();
}

class _InternetConnectivityWidgetState
    extends State<InternetConnectivityWidget> {
  ConnectivityResult? result;
  StreamSubscription? subscription;
  var isConnected = false;

  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    startStreaming();
    // notificationServices.initialiseNotification();
    // notificationServices.requestPermissionNotification();
  }

  checkInternet() async {
    result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      isConnected = true;
    } else {
      isConnected = false;
      showDialogBox();
    }
    setState(() {});
  }

  showDialogBox() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: const Text("No internet"),
              content: const Text("Please check your internet connection"),
              actions: [
                CupertinoButton(
                    child: const Text("Retry"),
                    onPressed: () {
                      Navigator.pop(context);
                      checkInternet();
                    })
              ],
            ));
  }

  startStreaming() {
    subscription = Connectivity().onConnectivityChanged.listen((event) {
      debugPrint('Current connectivity status: $event');
      checkInternet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("")),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                // notificationServices.sendNotification("This is the title", "this is the body");
              },
              child: const Text("Send Notification"),
            ),
          ),
          const SizedBox(height: 25),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // notificationServices.scheduleNotification("This is the title Schedule Notification", "This is the body Schedule Notification");
              },
              child: const Text("schedule Notification"),
            ),
          ),
        ],
      ),
    );
  }
}
