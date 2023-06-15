import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travelplanner/components/commonbutton.dart';
import 'package:travelplanner/components/navbar.dart';
import 'package:travelplanner/dayform_page/newdaypage.dart';
import 'package:travelplanner/destination_page/widgets/daycard.dart';
import 'package:travelplanner/utils.dart';

import '../components/backbanner.dart';
import '../models/day.dart';
import '../models/destination.dart';

class DestinationDetails extends StatefulWidget {
  final Destination destination;

  const DestinationDetails({super.key, required this.destination});

  @override
  _DestinationDetailsScreenState createState() =>
      _DestinationDetailsScreenState();
}

class _DestinationDetailsScreenState extends State<DestinationDetails> {
  List<DayCard> dayWidgets = [];

  @override
  void initState() {
    super.initState();
    fetchDayList();
  }

  Future<void> fetchDayList() async {
    List<DayCard> dayList = [];

    for (Day day in await Day.getDays(widget.destination.id)) {
      dayList.add(DayCard(day: day, destination: widget.destination,));
    }

    setState(() {
      dayWidgets = dayList;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const NavBar(),
        body: Column(children: [
      BackBanner(
          title: widget.destination.city,
          subtitle: "${formatDate(widget.destination.start_date)} - ${formatDate(widget.destination.end_date)}",
          onTap: () {}),
      Expanded(
        flex: 8,
        child: dayWidgets.isEmpty
            ? const Center(
                child: Text("Aucune journée planifiée"),
              )
            : Column(children: dayWidgets),
      ),
      CommonButton(
          "Add day",
          () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewDayPage(
                    destination: widget.destination,
                  ),
                ),
              ))
    ]));
  }
}
