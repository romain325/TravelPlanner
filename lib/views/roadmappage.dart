import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travelplanner/components/backbanner.dart';

class RoadMapPage extends StatefulWidget {
  const RoadMapPage({super.key});

  @override
  State<StatefulWidget> createState() => RoadMapPageState();
}

class RoadMapPageState extends State<RoadMapPage> {
  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    return Column(
      children: <Widget>[
        BackBanner(
            title: "Roadtrip",
            onTap: () {
              log("hiiiii");
            }),
        // SCROLLABLE ICI
        SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                Text("Départ"),
                Text("Arrivée"),
              ],
        )),
        Container(
            color: Color.fromRGBO(
                primaryColor.red, primaryColor.green, primaryColor.blue, 0.3),
            child: ElevatedButton(
              onPressed: () {},
              style: TextButton.styleFrom(backgroundColor: primaryColor),
              child: const Text("Add step"),
            ))
      ],
    );
  }
}
