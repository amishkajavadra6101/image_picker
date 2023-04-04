import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../image_picker_example.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static void initialize(BuildContext context) {
    // initializationSettings  for Android
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );
    _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payload) async {
        print("onSelectNotification");
        if (payload != null) {
          final payloadMap = payload as Map<String, dynamic>;
          if (payloadMap.containsKey('_id')) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ImagePickerExample(),
              ),
            );
          }
          // print("Router Value1234 ${_id.toString()}");
        }
      },
    );
  }

  static void display(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "image_picker",
          "image_pickerchannel",
          importance: Importance.max,
          priority: Priority.high,
        ),
      );

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: jsonEncode(message.data),
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
