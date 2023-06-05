import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travelplanner/components/backbanner.dart';
import 'package:travelplanner/components/navbar.dart';
import 'package:travelplanner/components/stepcard.dart';

class RoadMapPage extends StatefulWidget {
  const RoadMapPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RoadMapPageState();
}

class RoadMapPageState extends State<RoadMapPage> {
  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
        bottomNavigationBar: const NavBar(),
        body: Column(
          children: <Widget>[
            BackBanner(
                title: "Roadtrip",
                onTap: () {
                  log("hiiiii");
                }),
            // SCROLLABLE ICI
            SingleChildScrollView(
                child: Column(
              children: <Widget>[
                const Text("Départ"),
                StepCard(
                    name: "name", startDate: DateTime.now(), type: "transport"),
                const Text("Arrivée"),
              ],
            )),
            Container(
                color: Color.fromRGBO(primaryColor.red, primaryColor.green,
                    primaryColor.blue, 0.3),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/step/create");
                  },
                  style: TextButton.styleFrom(backgroundColor: primaryColor),
                  child: const Text("Add step"),
                ))
          ],
        ));
  }
}
