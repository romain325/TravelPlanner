import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:travelplanner/components/navbar.dart';
import 'package:travelplanner/dayform_page/newdaypage.dart';
import 'package:travelplanner/temp_page.dart';
import 'package:travelplanner/views/newtravelstep.dart';

import 'firebase_options.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';
import 'package:travelplanner/components/imagecard.dart';
import 'package:travelplanner/components/roadtripcard.dart';
import 'package:travelplanner/views/homepage.dart';
import 'package:travelplanner/views/newtravelpage.dart';
import 'package:travelplanner/views/roadmappage.dart';
import 'package:travelplanner/welcome_page/welcome_page.dart';

const d_purpose = Color(0xff800080);
const d_blue = Color(0xFF0000FF);
const d_black = Color(0xFF000000);

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  bool isAuth = false;
  UserCredential? user;

  MyApp({Key? key, this.user}) : super(key: key) {
    if (user != null) {
      isAuth = true;
    }
  }

  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home",
      routes: {
        "/home": (context) => const HomePage(),
        "/roadmap": (context) => const RoadMapPage(),
        "/travel/create": (context) => const NewTravelPage(),
        "/step/create": (context) => const NewTravelStep(),
        "/temp_page": (context) => TravelListScreen()
      },
      title: 'Travel Planner',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        colorScheme: const ColorScheme.light(),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        seconds: 1,
        navigateAfterSeconds: widget.isAuth ? const HomePage() : WelcomePage(),
        title: const Text(
          "Travel Planner",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              fontFamily: 'Futura',
              color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        loaderColor: Colors.white,
      ),
    );
  }
}
