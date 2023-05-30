import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:travel_planner/welcome_page.dart';
import 'welcome_page.dart';
import 'delayed_animation.dart';
import 'main.dart';
import 'register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            // NON
            image: AssetImage('C:/Users/JUDICAEL-FLORENT/Desktop/COURS 3IL/Travel_Planner/images/back.png'),
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
            LoginForm(),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyApp(),
                    ),
                  );
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
                      builder: (context) => RegisterPage(),
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
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          DelayedAnimation(
            delay: 500,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          DelayedAnimation(
            delay: 500,
            child: TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                ),
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
 