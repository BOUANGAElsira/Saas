import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notice_2_parents/Auth/login_page.dart';
import 'package:notice_2_parents/Screen/Screen.dart';
import 'Services/FirebaseMessaging.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'basic_chanel', 
        channelName: 'Basic notifications', 
        channelDescription: 'Notification chanel for basic tests',
      ),
    ],
    debug: true,
  );

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().catchError((error) {
    print("Erreur d'initialisation de Firebase : $error");
  });
  runApp(
    notice_2_parents(),
  );

  //FirebaseMessagingService firebaseMessagingService = FirebaseMessagingService();
  //firebaseMessagingService.configureFirebaseMessaging();
  //firebaseMessagingService.requestPermission();
}

class notice_2_parents extends StatelessWidget {
  const notice_2_parents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color.fromARGB(255, 255, 249, 220),
      title: 'EMA APP',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        backgroundColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      home: _handleAuth(),
    );
  }

  Widget _handleAuth() {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          //On est authentifié
          User? user = snapshot.data;
          // Utiliser l'objet user pour faire des traitements
          return new Screen_page();
        } else {
          //On n'est pas authentifié
          return new Login_page();
        }
      },
    );
  }
}
