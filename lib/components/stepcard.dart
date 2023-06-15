import 'package:flutter/material.dart';
import 'package:travelplanner/components/stylizedcard.dart';
import 'package:travelplanner/destination_page/destination_details.dart';
import 'package:travelplanner/models/destination.dart';
import 'package:travelplanner/temp_page.dart';

class StepCard extends StatelessWidget {
  final String name;
  final DateTime startDate;
  late Icon icon;
  final String destId;

  StepCard(
      {Key? key,
      required this.name,
      required this.startDate,
      required type,
      required this.destId})
      : super(key: key) {
    if (type == "transport") {
      icon = const Icon(Icons.directions_transit_rounded);
    } else if (type == "destination") {
      icon = const Icon(Icons.beach_access_rounded);
    } else {
      icon = const Icon(Icons.question_mark_rounded);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Destination.getDestination(destId).then((value) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DestinationDetails(destination: value!)));
          });
        },
        child: StylizedCard(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                children: [icon, Text(name)],
              ),
              VerticalDivider(
                color: Theme.of(context).secondaryHeaderColor,
                width: 50,
                thickness: 2,
              ),
              Text(startDate.toString())
            ],
          ),
        ));
  }
}
