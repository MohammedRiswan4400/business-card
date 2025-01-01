import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackroundMessages(RemoteMessage message) async {
  log('Title : ${message.notification!.title}');
  log('Body : ${message.notification!.body}');
  log('Payload : ${message.data}');
}

class Fcm {
  static Future<void> createFCMTOKEN() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? fcmToken = await messaging.getToken();
    User? user = FirebaseAuth.instance.currentUser;
    // String userId = user!.email!;
    log('---------------------- ${fcmToken!} ----------------------');

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.email)
        .collection('User Datas')
        .doc('FCM')
        .set({'FCM-Token': fcmToken});

    // ignore: use_build_context_synchronously

    log('FCM successfully!');
  }

  static Future<void> initNotification() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Request permission for notifications
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('User granted provisional permission');
    } else {
      log('User denied permission');
      return;
    }

    // Get APNs token for iOS
    String? apnsToken = await messaging.getAPNSToken();
    log('APNs Token: $apnsToken');

    // Get FCM token
    String? fcmToken = await messaging.getToken();
    log('FCM Token: $fcmToken');

    FirebaseMessaging.onBackgroundMessage(handleBackroundMessages);
  }
}
