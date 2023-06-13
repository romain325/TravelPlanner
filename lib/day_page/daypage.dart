import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelplanner/components/commonbutton.dart';
import 'package:travelplanner/day_page/widgets/activityCard.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../activityform_page/widgets/activityForm.dart';
import '../components/backbanner.dart';
import '../models/activity.dart';
import '../models/day.dart';
import '../models/destination.dart';

class DayPage extends StatefulWidget {
  final Day day;
  final Destination destination;

  const DayPage({super.key, required this.day, required this.destination});

  @override
  _DayPageScreenState createState() => _DayPageScreenState();
}

class _DayPageScreenState extends State<DayPage> {
  List<ActivityCard> activityWidgets = [];

  @override
  void initState() {
    super.initState();
    fetchActivityList();
  }

  Future<void> fetchActivityList() async {
    List<ActivityCard> activityList = [];

    for (Activity activity in await Activity.getActivities(widget.day.id)) {
      activityList.add(ActivityCard(
        activity: activity,
        day: widget.day,
        destination: widget.destination,
      ));
    }

    setState(() {
      activityWidgets = activityList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BackBanner(
            title: widget.destination.city,
            subtitle: widget.day.date,
            onTap: () {}),
        Expanded(
            flex: 8,
            child: activityWidgets.isEmpty
                ? Text("Aucune activité associée")
                : CarouselSlider(
                    options: CarouselOptions(
                        enableInfiniteScroll: false,
                        height: 600,
                    ),
                    items: activityWidgets)),
        CommonButton(
            "Add Activity",
            () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActivityForm(
                      day: widget.day,
                      activity: Activity(
                          address: '',
                          day_id: '',
                          duration: '',
                          hour: '',
                          price: '',
                          title: '',
                          comment: ''),
                      destination: widget.destination,
                    ),
                  ),
                ))
      ],
    );
  }
}
