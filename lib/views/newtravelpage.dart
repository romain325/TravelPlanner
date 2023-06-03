import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelplanner/components/backbanner.dart';
import 'package:travelplanner/components/stylizedcard.dart';
import 'package:travelplanner/view_components/newtravelcomp/newtravelform.dart';

class NewTravelPage extends StatefulWidget {
  const NewTravelPage({super.key});

  @override
  State<StatefulWidget> createState() => NewTravelPageState();
}

class NewTravelPageState extends State<NewTravelPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BackBanner(
          message: "New travel",
          onTap: () {
            log("GET BACK");
          },
        ),
        const StylizedCard(
          child: NewTravelForm(),
        )
      ],
    );
  }
}
