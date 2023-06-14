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
  bool isAuth = true;

  MyApp({Key? key}) : super(key: key);

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

class NavigationRouter extends StatefulWidget {
  const NavigationRouter({super.key});

  @override
  State<StatefulWidget> createState() => NavigationRouterState();
}

class NavigationRouterState extends State<NavigationRouter> {
  int currentPageIndex = 0;

  List<Widget Function(BuildContext)> pages = [
    (context) => const HomePage(),
    (context) => const NewTravelPage(),
    (context) => const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.explore),
              label: "Explore",
            ),
            NavigationDestination(icon: Icon(Icons.add), label: "Plan travel"),
            NavigationDestination(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
        body: pages[currentPageIndex](context));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ImageCard.from(
              "My label",
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
            ),
            RoadTripCard(
                name: "voyage",
                startDate: DateTime.utc(2001, 10, 16),
                endDate: DateTime.now(),
                departure: "Moulins",
                arrival: "Lyon",
                destCnt: 5)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
