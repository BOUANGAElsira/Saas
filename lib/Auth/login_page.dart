import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:notice_2_parents/Auth/Sign_up.dart';
import 'package:notice_2_parents/Auth/forgot.dart';
import 'package:notice_2_parents/Screen/Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  bool _isGoogleLoading = false;
  bool _log = true;

  Future<void> signInWithGoogle() async {
    setState(() {
      _isGoogleLoading = true;
    });

    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      setState(() {
        _isGoogleLoading = false;
      });
      return;
    }

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);

    setState(() {
      _isGoogleLoading = false;
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade400,
        body: Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
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
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: bouttonAppuyer,
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
            SizedBox(height: 16.0),
            Text('_________________OR_________________'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isGoogleLoading ? null : signInWithGoogle,
              child: _isGoogleLoading
                  ? CircularProgressIndicator()
                  : Text('Login with Google'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.brown),
              ),
            ),
          ],
        ),
      ),
    ));
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

  // Fonction pour gérer le login
/*   void login() async {
    String email = ""; // Ajoutez ici la logique pour récupérer l'email à partir du TextField
    String password = ""; // Ajoutez ici la logique pour récupérer le mot de passe à partir du TextField

 */ /*     // Exécution de la requête d'insertion des identifiants dans la base de données
    await conn.query('INSERT INTO users (login, userPassword) VALUES (?, ?)',
        [email, password]);

    // Fermeture de la connexion à la base de données
    await conn.close();
  }*/
}

//package:notice_2_parents/Models/mysql.dart