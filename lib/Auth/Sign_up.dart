import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:animate_do/animate_do.dart';
import 'package:notice_2_parents/Auth/Verification.dart';
import 'package:notice_2_parents/Auth/login_page.dart';

class Sign_up_page extends StatefulWidget {
  const Sign_up_page({super.key});

  @override
  State<Sign_up_page> createState() => _Sign_up_pageState();
}

class _Sign_up_pageState extends State<Sign_up_page> {
  final TextEditingController controller = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(245, 245, 245, 220),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                FadeInDown(
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.brown),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                /* SizedBox(
                  height: 20,
                ), */
                FadeInDown(
                  delay: Duration(milliseconds: 400),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black.withOpacity(0.13)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffeeeeee),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        TextField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0.0),
                            labelText: 'Name',
                            hintText: 'Enter your name',
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
                              borderSide: BorderSide(
                                  color: Colors.grey.shade200, width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.5),
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
                            labelText: 'Firstname',
                            hintText: 'Enter your firstname',
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
                              borderSide: BorderSide(
                                  color: Colors.grey.shade200, width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.5),
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
                              borderSide: BorderSide(
                                  color: Colors.grey.shade200, width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.5),
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
                              borderSide: BorderSide(
                                  color: Colors.grey.shade200, width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        /*  Positioned(
                          left: 90,
                          top: 8,
                          bottom: 8,
                          child: Container(
                            height: 40,
                            width: 1,
                            color: Colors.black.withOpacity(0.13),
                          ),
                        ), */
                      ], //Children
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 600),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    onPressed: () {
                      setState(() {
                        _isLoading = true;
                      });

                      Future.delayed(Duration(seconds: 2), () {
                        setState(() {
                          _isLoading = false;
                        });
                        /* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login_page())); */
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Verification()));
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeInDown(
                  child: MaterialButton(
                    onPressed: bouttonAppuyer,
                    height: 45,
                    color: Colors.brown,
                    child: Text(
                      "Create account",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 800),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      /*  InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.black),
                        ),
                      ) */
                      TextButton(
                        onPressed: bouttonAppuyer,
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void bouttonAppuyer() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login_page()),
    );
  }
}
