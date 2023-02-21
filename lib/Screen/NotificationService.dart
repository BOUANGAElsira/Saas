import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  StreamController<String> _messageStreamController = StreamController<String>.broadcast();

  Stream<String> get messageStream => _messageStreamController.stream;

  void initialize() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _messageStreamController.add(message.notification?.body ?? '');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _messageStreamController.add(message.notification?.body ?? '');
    });
  }

  void dispose() {
    _messageStreamController.close();
  }
}
