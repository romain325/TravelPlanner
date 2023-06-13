import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelplanner/components/commonbutton.dart';
import 'package:travelplanner/dayform_page/widgets/newdayform.dart';
import 'package:travelplanner/destination_page/widgets/daycard.dart';
import 'package:travelplanner/models/activity.dart';

import '../components/backbanner.dart';
import '../models/day.dart';
import '../models/destination.dart';

class ActivityFormPage extends StatefulWidget {
  final Day day;
  final Destination destination;

  const ActivityFormPage({super.key, required this.day, required this.destination});

  @override
  _ActivityFormPageScreenState createState() =>
      _ActivityFormPageScreenState();
}

class _ActivityFormPageScreenState extends State<ActivityFormPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BackBanner(
          title: "Nouvelle activité",
          onTap: () {}),
      Expanded(
        flex: 7,
        child: Column(children: [
            ActivityFormPage(day: widget.day, destination: widget.destination,)
        ],
      )),
    ]);
  }
}
