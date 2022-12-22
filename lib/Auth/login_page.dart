import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:notice_2_parents/Auth/Sign_up.dart';
import 'package:notice_2_parents/Auth/forgot.dart';
import 'package:notice_2_parents/Screen/Screen.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(245, 245, 245, 220),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 5,
        title: const Text(
          "Login page",
          style: TextStyle(
              color: (Colors.white), fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /* Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: AnimatedOpacity(
                opacity: activeIndex == 0 ? 1 : 0,
                duration: Duration(
                  seconds: 1,
                ),
                curve: Curves.linear,
                child: Image.network(
                  'https://th.bing.com/th/id/OIP.2loF-dnZj3Wix_0VgU95hgHaHa?w=172&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7',
                  height: 400,
                ),
              ),
            ), */
            SizedBox(
              height: 40,
            ),
            TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                labelText: 'Email',
                hintText: 'Username or e-mail',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                prefixIcon: Icon(
                  Iconsax.user,
                  color: Colors.black,
                  size: 18,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                floatingLabelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                labelText: 'Password',
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Icon(
                  Iconsax.key,
                  color: Colors.black,
                  size: 18,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                floatingLabelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: boutton,
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: appuye,
              height: 45,
              color: Colors.brown,
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: bouttonAppuyer,
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                        color: Colors.brown,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
            /*  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new IconButton(
                onPressed: onPressed, icon: new Icon(Icons.))
            ],
          ) */
          ],
        ),
      ),
    );
  }

  void bouttonAppuyer() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Sign_up_page()),
    );
  }

  void boutton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Forgot_page()),
    );
  }

  void appuye() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Screen_page()),
    );
  }
}
