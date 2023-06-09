import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../welcome_page/welcome_page.dart';
import '../delayed_animation.dart';
import '../main.dart';
import '../signup_page/register.dart';
import 'widgets/loginform_login.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginInformation extends StatefulWidget {
  const LoginInformation({Key? key}) : super(key: key);

  @override
  State<LoginInformation> createState() => _LoginInformationState();
}



class _LoginInformationState extends State<LoginInformation> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /*final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /*AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),*/
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('../assets/back.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DelayedAnimation(
                        delay: 0,
                        child: Text(
                          "Connect you with your Identifier. "
                              "if you don't have ther register you",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,

                          ),
                        ),
                      ),
                      const SizedBox(height: 22),
                      DelayedAnimation(
                        delay: 0,
                        child: Text(
                          "It's recommended to connect your username and your password"
                              " for us to better protect your information. "
                              "If you don't have an Account then click on register",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,

                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 95),
                LoginForm(emailController: _emailController, passwordController: _passwordController,),
                const SizedBox(height: 125),
                DelayedAnimation(
                  delay: 0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      primary: d_purpose,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 125,
                        vertical: 13,
                      ),
                    ),
                    child: Text(
                      'CONFIRM',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () async {
                      String email = _emailController.value.text;
                      String password = _passwordController.value.text;
                      debugPrint("$email $password");
                      signInWithEmailAndPassword(email, password).then((value) => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyApp(user: value),
                          ),
                        )
                      });
                    },
                  ),
                ),

                DelayedAnimation(
                  delay: 500,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      primary: d_purpose,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 125,
                        vertical: 15,

                      ),
                    ),
                    child: Text(
                      'REGISTER',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 0.75,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterInformation(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 35),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WelcomePage(),
                          ),
                        );
                      },
                      child: DelayedAnimation(
                        delay: 0,
                        child: Text(
                          "BACK",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}

Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {

  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    print('user connected');
    return userCredential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
    return null;
  }

}

