import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppNotifications {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  AppNotifications() {
    initLocalNotifications();
  }

  Future<void> initLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );

    InitializationSettings initializationSettings =
        const InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) {
        navigateToView(details.data);
      },
      onDidReceiveBackgroundNotificationResponse: onReceiveBackgroundResponse,
    );

    _setupNotificationChannels();
  }

  Future<void> _setupNotificationChannels() async {
    AndroidNotificationChannel defaultChannel =
        const AndroidNotificationChannel(
          'channel_id',
          'Default Channel',
          description: 'Channel for default notifications',
          importance: Importance.max,
          playSound: true,
        );

    AndroidNotificationChannel customChannel = const AndroidNotificationChannel(
      'tech_channel_id',
      'Custom Sound Channel',
      description: 'Channel with custom sound notifications',
      importance: Importance.max,
      sound: RawResourceAndroidNotificationSound('sound'),
      playSound: true,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(defaultChannel);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(customChannel);
  }

  Future<void> showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;

    String? sound = notification?.toMap()['sound'];
    AndroidNotificationDetails androidNotificationDetails =
        _getAndroidNotificationDetails(sound);
    DarwinNotificationDetails iosPlatformChannelSpecifics =
        DarwinNotificationDetails(
          sound: sound != null ? '$sound.caf' : null,
          // Leave as null if no custom sound
          presentSound: true,
          presentAlert: true,
          presentBadge: true,
        );
    if (notification != null) {
      await flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: androidNotificationDetails,
          iOS: iosPlatformChannelSpecifics,
        ),
      );
    }
  }

  AndroidNotificationDetails _getAndroidNotificationDetails(String? sound) {
    return AndroidNotificationDetails(
      sound != null ? 'tech_channel_id' : 'channel_id',
      sound != null ? 'Custom Sound Channel' : 'Default Channel',
      channelDescription: sound != null
          ? 'Channel with custom sound notifications'
          : 'Default notifications channel',
      importance: Importance.max,
      priority: Priority.high,
      sound: sound != null ? RawResourceAndroidNotificationSound(sound) : null,
      playSound: true,
      ticker: 'ticker',
    );
  }

  @pragma('vm:entry-point')
  static void onReceiveBackgroundResponse(NotificationResponse details) async {
    navigateToView(details.data);
  }


  static void navigateToView(Map<String, dynamic> details) {

  }
}
