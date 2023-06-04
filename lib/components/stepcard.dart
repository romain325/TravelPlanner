import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelplanner/components/stylizedcard.dart';

class StepCard extends StatelessWidget {

  final String name;
  final DateTime startDate;
  late Icon icon;

  StepCard({Key? key, required this.name, required this.startDate, required type}) : super(key: key) {
    if(type == "transport") {
      icon = const Icon(Icons.directions_transit_rounded);
    } else if(type == "destination") {
      icon = const Icon(Icons.beach_access_rounded);
    } else {
      icon = const Icon(Icons.question_mark_rounded);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StylizedCard(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(
            children: [
              icon,
              Text(name)
            ],
          ),
          VerticalDivider(color: Theme.of(context).secondaryHeaderColor, width: 50, thickness: 2,),
          Text(startDate.toString())
        ],
      ),
    );
  }
  
}