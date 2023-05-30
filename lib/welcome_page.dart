import 'package:flutter/material.dart';
import 'delayed_animation.dart';
import 'main.dart';
import 'login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('./back.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 60,
                horizontal: 30,
              ),
              child: Column(
                children: [
                  DelayedAnimation(
                    delay: 0,
                    child: SizedBox(
                      height: 150,
                      child: Image.asset('./travelo.png'),
                    ),
                  ),
                  /*DelayedAnimation(
                    delay: 0,
                    child: Container(
                      height: 500,
                      margin: EdgeInsets.only(
                        top: 30,
                        bottom: 20,
                      ),
                      child: Text(
                        'Planifier votre voyage',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 50,
                        ),
                      ),
                    ),
                  ),*/
                  const SizedBox(height: 500),

                  DelayedAnimation(
                    delay: 0,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: d_purpose,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.all(13),
                        ),
                        child: const Text('GET STARTED'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
