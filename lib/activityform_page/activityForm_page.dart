import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelplanner/activityform_page/widgets/activityForm.dart';
import 'package:travelplanner/components/commonbutton.dart';
import 'package:travelplanner/components/navbar.dart';
import 'package:travelplanner/dayform_page/widgets/newdayform.dart';
import 'package:travelplanner/destination_page/widgets/daycard.dart';
import 'package:travelplanner/models/activity.dart';

import '../components/backbanner.dart';
import '../models/day.dart';
import '../models/destination.dart';

class ActivityFormPage extends StatefulWidget {
  final Day day;
  final Destination destination;

  const ActivityFormPage(
      {super.key, required this.day, required this.destination});

  @override
  _ActivityFormPageScreenState createState() => _ActivityFormPageScreenState();
}

class _ActivityFormPageScreenState extends State<ActivityFormPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const NavBar(),
        body: Column(
          children: <Widget>[
            BackBanner(
                title: "Nouvelle activité",
                onTap: () {
                  Navigator.pop(context);
                }),
            ActivityForm(
              day: widget.day,
              destination: widget.destination,
              activity: Activity(
                  address: "",
                  comment: "",
                  day_id: widget.day.id,
                  duration: "",
                  hour: "",
                  price: "",
                  title: ""),
            )
          ],
        ));
  }
}
