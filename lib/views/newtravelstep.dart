import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travelplanner/components/backbanner.dart';
import 'package:travelplanner/components/navbar.dart';
import 'package:travelplanner/components/stylizedcard.dart';
import 'package:travelplanner/view_components/newstepcomp/newstepform.dart';

class NewTravelStep extends StatefulWidget {

  final String travelId;
  const NewTravelStep({Key? key, required this.travelId}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NewTravelStepState();

}

class NewTravelStepState extends State<NewTravelStep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const NavBar(),
      body: Column(
      children: <Widget>[
        BackBanner(
          title: "New travel step",
          onTap: () {
            Navigator.pop(context);
          },
        ),
        StylizedCard(
          child: NewStepForm(travelId: widget.travelId),
        )
      ],
    ));
  }
}