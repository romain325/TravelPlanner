import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travelplanner/components/backbanner.dart';
import 'package:travelplanner/components/navbar.dart';
import 'package:travelplanner/components/stylizedcard.dart';
import 'package:travelplanner/view_components/newstepcomp/newstepform.dart';

class NewTravelStep extends StatefulWidget {
  const NewTravelStep({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NewTravelStepState();

}

class NewTravelStepState extends State<NewTravelStep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      children: <Widget>[
        BackBanner(
          title: "New travel",
          onTap: () {
            log("GET BACK");
            Navigator.pop(context);
          },
        ),
        const StylizedCard(
          child: NewStepForm(),
        )
      ],
    ));
  }
}