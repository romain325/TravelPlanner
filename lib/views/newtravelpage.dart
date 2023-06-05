import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travelplanner/components/backbanner.dart';
import 'package:travelplanner/components/navbar.dart';
import 'package:travelplanner/components/stylizedcard.dart';
import 'package:travelplanner/view_components/newtravelcomp/newtravelform.dart';

class NewTravelPage extends StatefulWidget {
  const NewTravelPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NewTravelPageState();
}

class NewTravelPageState extends State<NewTravelPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavBar(),
        body: Column(
      children: <Widget>[
        BackBanner(
          title: "New travel",
          onTap: () {
            log("GET BACK");
            Navigator.pushNamed(context, "/home");
          },
        ),
        const StylizedCard(
          child: NewTravelForm(),
        )
      ],
    ));
  }
}
