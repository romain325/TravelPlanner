import 'package:flutter/material.dart';
import 'package:travelplanner/utils.dart';

import '../../day_page/daypage.dart';
import '../../models/day.dart';
import '../../models/destination.dart';

class DayCard extends StatefulWidget {
  final Day day;
  final Destination destination;

  const DayCard({super.key, required this.day, required this.destination});

  @override
  State<StatefulWidget> createState() => DayCardState();
}

class DayCardState extends State<DayCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () =>  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DayPage(
              day: widget.day,
              destination: widget.destination
            ),
          ),
        ),
        child: Card(
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      flex: 2, // takes 30% of available width
                      child: Icon(Icons.calendar_today_rounded,
                          size: 30, color: Colors.purple),
                    ),
                    Expanded(
                        flex: 6, // takes 70% of available width
                        child: Column(
                          children: [
                            Text(formatDate(widget.day.date),
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(children: [
                                  const Text("Planning",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey)),
                                  const SizedBox(height: 5),
                                  Text(
                                      "${widget.day.activity_count} activities",
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.black))
                                ]),
                                Column(children: [
                                  const Text("Wake up",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey)),
                                  const SizedBox(height: 5),
                                  Text(widget.day.wake_up,
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.black))
                                ]),
                              ],
                            )
                          ],
                        )),
                    const Expanded(
                      flex: 2, // takes 70% of available width
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 30,
                        color: Colors.purple,
                      ),
                    )
                  ],
                ))));
  }
}
