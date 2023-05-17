
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';
import 'package:travelplanner/components/imagecard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Planner',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        colorScheme: const ColorScheme.light(),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: const MyHomePage(title: "Travel planner"),
        title: const Text(
          "Travel Planner",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            fontFamily: 'Futura',
            color: Colors.white
          ),
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

  List<Widget> pages = [const MyHomePage(title: "title"), const MyHomePage(title: "title2"), const MyHomePage(title: "title3")];

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
          NavigationDestination(icon: Icon(Icons.explore), label: "Explore"),
          NavigationDestination(icon: Icon(Icons.add), label: "Plan travel"),
          NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
      body: pages[currentPageIndex]
    );
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
            const ImageCard(imageLink: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg', label: "My label")
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
