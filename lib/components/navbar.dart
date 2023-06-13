import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travelplanner/views/homepage.dart';
import 'package:travelplanner/views/newtravelpage.dart';
import 'package:travelplanner/views/roadmappage.dart';

class NavBar extends StatelessWidget {

  final List<String> pages = const ["/home","/travel/create", "/temp_page"];


  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentRoute = ModalRoute.of(context)?.settings.name ?? "/home";
    int currentIndex = currentRoute == "/home" ? 0 : (currentRoute == "/travel/create" ? 1 : (currentRoute == "/temp_page" ? 2 : 3));

    List<Widget> widgets = [
      const NavigationDestination(icon: Icon(Icons.explore), label: "Explore", ),
      const NavigationDestination(icon: Icon(Icons.add), label: "Plan travel"),
      const NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
    ];

    if(currentIndex == 3) {
      widgets.add(const NavigationDestination(icon: Icon(Icons.widgets), label: "Current route"));
    }

    return NavigationBar(
      onDestinationSelected: (int index) {
        Navigator.pushNamed(context, pages[index]);
      },
      selectedIndex: currentIndex,
      destinations: widgets,
    );
  }

}