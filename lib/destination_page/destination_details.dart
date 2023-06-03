import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/day.dart';

class DestinationDetails extends StatefulWidget {
  final String destinationId;

  DestinationDetails({required this.destinationId});

  @override
  _DestinationDetailsScreenState createState() =>
      _DestinationDetailsScreenState();
}

class _DestinationDetailsScreenState extends State<DestinationDetails> {
  List<Day> dayList = [];

  @override
  void initState() {
    super.initState();
    fetchDayList();
  }

  Future<void> fetchDayList() async {
    List<Day> days = await Day.getDays(widget.destinationId);
    setState(() {
      dayList = days;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des jours'),
      ),
      body: dayList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: dayList.length,
              itemBuilder: (BuildContext context, int index) {
                Day day = dayList[index];
                return Card(
                  // ... autres propriétés de la Card
                  child: ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text(day.date),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Text('${day.comment} (${day.activityCount} activités)'),
                        //Text('Réveil : ${day.wakeUpTime}'),
                      ],
                    ),
                    onTap: () {
                      //navigateToActivityList(day);
                    },
                  ),
                );
              },
            ),
    );
  }
}
