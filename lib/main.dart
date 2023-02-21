import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notice_2_parents/Auth/login_page.dart';
import 'Services/FirebaseMessaging.dart';

void main() async{
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
        primaryColor: Colors.brown,
      ),
      debugShowCheckedModeBanner: false,
      home: const Login_page(),
    );
  }
}
