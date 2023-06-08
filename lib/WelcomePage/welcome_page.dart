import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Animation/delayed_animation.dart';
import 'login_page.dart';
import 'main.dart';
import 'register.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('C:/Users/JUDICAEL-FLORENT/Desktop/COURS 3IL/TravelPlanner/images/back.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 60,
                horizontal: 30,
              ),
              child: Column(
                children: [
                  DelayedAnimation(
                    delay: 0,
                    child: Container(
                      height: 150,
                      child: Image.asset('C:/Users/JUDICAEL-FLORENT/Desktop/COURS 3IL/'
                          'TravelPlanner/images/travelo.png'),
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
                  SizedBox(height: 500),

                  DelayedAnimation(
                    delay: 0,
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: d_purpose,
                          shape: StadiumBorder(),
                          padding: EdgeInsets.all(13),
                        ),
                        child: Text('GET STARTED'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginInformation(),
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
