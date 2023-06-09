import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../delayed_animation.dart';
import '../main.dart';
import '../signin_page/login_page.dart';
import 'widgets/loginform_register.dart';
import '../models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';

class RegisterInformation extends StatefulWidget {
  const RegisterInformation({Key? key}) : super(key: key);


  @override
  State<RegisterInformation> createState() => _RegisterInformationState();
}



class _RegisterInformationState extends State<RegisterInformation> {


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          AppBar(
            elevation: 0,
            backgroundColor: Colors.white.withOpacity(0),
            leading: IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),

          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    '../assets/back.png'),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DelayedAnimation(
                        delay: 0,
                        child: Text(
                          "REGISTER",
                          style: GoogleFonts.poppins(
                            color: d_purpose,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 22),
                      DelayedAnimation(
                        delay: 0,
                        child: Text(
                          "Choose a Username and Password "
                              "that you want to use for this app ",
                          style: GoogleFonts.poppins(
                            color: Colors.grey[600],
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 35),
                LoginForm(
                  emailController: _emailController,
                  passwordController: _passwordController,),
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
                      'REGISTER',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      String email = _emailController.value.text;
                      String password = _passwordController.value.text;

                      debugPrint("$email $password");
                      signUp(email, password);
                      //User("", firstname, password, username).insertUser();
                      //debugPrint(username);
                      //debugPrint(password);

                      /*FirebaseFirestore.instance.collection('DataTravelPlanner').add({
                    'FirstName': firstname,
                    'Username': username,
                    'password': password,
                  });*/

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 90),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 35),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginInformation(),
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

Future<void> signUp(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    // L'inscription a réussi, vous pouvez ajouter des actions supplémentaires ici
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('Le mot de passe est trop faible.');
    } else if (e.code == 'email-already-in-use') {
      print('L\'adresse email est déjà utilisée.');
    }
  } catch (e) {
    print(e.toString());
  }
}
/*Appelez la méthode signUp() lorsque vous souhaitez enregistrer un nouvel utilisateur :
dart
Copy code
signUp('example@example.com', 'password123');
Ces étapes vous permettront de mettre en place l'inscription par email et mot de passe avec Firebase dans votre application Flutter. Assurez-vous également d'avoir configuré Firebase correctement et que votre application peut communiquer avec Firebase.*/






