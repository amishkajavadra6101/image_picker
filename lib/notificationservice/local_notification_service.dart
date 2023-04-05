import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../image_picker_example.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  //Initialisation can be done in the main function of your application or can be done within the first page shown in your app.
  static void initialize(BuildContext context) {
    //By using InitializationSettings, you can specify how the notifications should behave on different platforms,
    // such as which icon to use, how they should sound, and other options
    const InitializationSettings initializationSettings =
        InitializationSettings(
      //
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );
    //onDidReceiveNotificationResponse is an optional callback function that is called when a notification is received
    //while the app is running. This function can be used to handle user interactions with the notification,
    // such as opening a specific screen or performing a specific action.
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      //The message parameter is provided by the flutter_local_notifications plugin
      // when the onDidReceiveNotificationResponse callback function is called
      //The reason why the message parameter is used is because it provides a convenient way to access information about the
      // notification that was tapped, such as the notification's ID, its payload, and other metadata.
      // This information can then be used to determine what action to take in response to the notification.
      onDidReceiveNotificationResponse: (message) async {
        debugPrint("onSelectNotification");
        String? itemId = message.payload; //Extract the payload value
        if (itemId != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ImagePickerExample(
                  // id: message.data["_id"],
                  ),
            ),
          );
        }
      },
    );
  }

  static void display(RemoteMessage message) async {
    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    //The AndroidNotificationDetails object is used to define the details of the notification that will be displayed on an Android
    // device. It is necessary to create this object to configure the notification's behavior on an Android device.
    NotificationDetails notificationDetails = const NotificationDetails(
      android: AndroidNotificationDetails(
        'image_picker', 'image_pickerchannel',
        // you might create separate channels for different types of notifications, such as messages, updates, and alerts.
        // This allows users to mute or customize notifications for specific channels without affecting other types of notifications.

        channelDescription: 'this is example code of all the packages',
        //The channel description can be used to provide a brief explanation of what the channel is used for and
        // what type of notifications the user can expect to see.
        // This helps the user to understand and manage notifications from your app more effectively.

        importance: Importance.high,
        // notification with a high importance level will typically show up as a heads-up notification
        // and may even appear on the lock screen, while a low importance level notification may not show up as a heads-up notification
        // or appear on the lock screen.

        priority: Priority.high,
        ticker: 'ticker',
        //The ticker text to display in the status bar when the notification is first posted.
        // This is a short message that is displayed briefly at the top of the screen,
        // and is intended to provide a quick summary of the notification,

        enableVibration: true,
        playSound: true,
      ),
    );

    //here we call show method on the flutterLocalNotificationsPlugin instance to display the notification.
    await flutterLocalNotificationsPlugin.show(
      id,
      //id: A unique identifier for the notification.
      // If you want to update or cancel this notification later, you will need to use this id.

      message.notification!.title,
      //The title of the notification.

      message.notification!.body,
      //The body text of the notification.

      notificationDetails,
      //The NotificationDetails object we created earlier.

      payload: message.data["_id"],
      //payload: An optional payload to associate with the notification.
      // This can be used to provide additional information to the app when the user interacts with the notification.
    );
  }
}
