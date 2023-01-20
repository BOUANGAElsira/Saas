import 'package:flutter/material.dart';
import 'package:notice_2_parents/Auth/login_page.dart';
import 'package:notice_2_parents/Screen/profile.dart';

void main() {
  runApp(
    notice_2_parents(),
  );
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
      //home: Screen_page(),
      //home: Profile_page(),
      home: const Login_page(),
    );
  }
}
