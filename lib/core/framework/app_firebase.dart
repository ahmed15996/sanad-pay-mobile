import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../firebase_options.dart';
import 'app_notification.dart';

@injectable
class AppFirebase {
  final AppNotifications appNotifications;

  AppFirebase({required this.appNotifications});

  Future<void> initializeFirebaseNotifications() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await getFCMPermission();
    await registerFCMForegroundListener();
    await registerFCMBackgroundListener();
    await listenOnMessageOpenedApp();
  }

  Future<void> listenOnMessageOpenedApp() async {
    try {
      FirebaseMessaging.onMessageOpenedApp
          .listen(_firebaseMessageOpenAppHandler);
    } catch (e) {
      debugPrint("registerFCMBackgroundListenerError: $e");
    }
  }

  Future<void> getFCMPermission() async {
    try {
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true, // Required to display a heads up notification
        badge: true,
        sound: true,
      );
      await FirebaseMessaging.instance
          .requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: true,
        criticalAlert: false,
        provisional: true,
        sound: true,
      );
    } catch (e) {
      debugPrint('User granted permission error : $e');
    }
  }

  Future<String?> getFirebaseToken() async {
    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      String? token = await messaging.getToken();
      return token;
    } catch (e) {
      throw Exception('getFirebaseTokenError: $e');
    }
  }

  Future<void> registerFCMBackgroundListener() async {
    try {
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);
    } catch (e) {
      debugPrint("registerFCMBackgroundListenerError: $e");
    }
  }

  Future<void> registerFCMForegroundListener() async {
    try {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        debugPrint("RemoteMessage: ${jsonEncode(message.toMap())}");
        if (Platform.isAndroid) {
          appNotifications.showNotification(message);
        }
      });
    } catch (e) {
      debugPrint("registerFCMForegroundListenerError: $e");
    }
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('Message data: ${message.data}');
}

@pragma('vm:entry-point')
Future<void> _firebaseMessageOpenAppHandler(RemoteMessage message) async {
  debugPrint('Handling click on message : ${message.messageId}');
  debugPrint("RemoteMessage: ${jsonEncode(message.toMap())}");
}
