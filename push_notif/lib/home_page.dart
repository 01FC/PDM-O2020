import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _fcm = FirebaseMessaging();
  var _localNotifications = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    if (Platform.isIOS) {
      // configure APNs
    } else {
      _configureFCMListener();
    }
    _configureLocalNotifications();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi app"),
      ),
      body: Center(
        child: Text("Esperando mensajes"),
      ),
    );
  }

  _showNotification(String titulo, String message) async {
    var androidPlatformChannel = AndroidNotificationDetails(
      "com.example.push_notif",
      "Mi app name",
      "Grupo de amigos notificaciones",
      importance: Importance.max,
      priority: Priority.max,
    );

    var iOSPlatformChannel = IOSNotificationDetails();

    var platformChannelDetails = NotificationDetails(
      android: androidPlatformChannel,
      iOS: iOSPlatformChannel,
    );

    await _localNotifications.show(
      0,
      titulo,
      message,
      platformChannelDetails,
      payload: "Default_sound",
    );
  }

  _configureLocalNotifications() {
    var androidConfig = AndroidInitializationSettings("@mipmap/ic_launcher");
    var iOSConfig = IOSInitializationSettings();

    var initSettings = InitializationSettings(
      android: androidConfig,
      iOS: iOSConfig,
    );
    _localNotifications.initialize(initSettings, onSelectNotification: null);
  }

  _configureFCMListener() async {
    _fcm.configure(
      onMessage: (message) async {
        print("OnMessage: $message");
        // pintar notificacion/dialog/snackbar/banner
        _showNotification(
          message["notification"]["title"],
          message["notification"]["body"],
        );
      },
      onResume: (message) async {},
      onLaunch: (message) async {},
    );

    String token = await _fcm.getToken();
    print("TOKEN: $token");
  }
}
