import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelplanner/components/commonbutton.dart';
import 'package:travelplanner/dayform_page/widgets/newdayform.dart';
import 'package:travelplanner/destination_page/widgets/daycard.dart';

import '../components/backbanner.dart';
import '../models/day.dart';
import '../models/destination.dart';

class NewDayPage extends StatefulWidget {
  final Destination destination;

  const NewDayPage({super.key, required this.destination});

  @override
  _NewDayPageScreenState createState() =>
      _NewDayPageScreenState();
}

class _NewDayPageScreenState extends State<NewDayPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BackBanner(
          title: "New Day",
          subtitle: widget.destination.city,
          onTap: () {}),
      Expanded(
        flex: 8,
        child: Column(children: [
            NewDayForm(destination: widget.destination)
        ],
      )),
    ]);
  }
}
