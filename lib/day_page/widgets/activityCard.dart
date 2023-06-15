import 'package:flutter/material.dart';

import '../../activityform_page/widgets/activityForm.dart';
import '../../day_page/daypage.dart';
import '../../models/activity.dart';
import '../../models/day.dart';
import '../../models/destination.dart';

class ActivityCard extends StatefulWidget {
  final Activity activity;
  final Day day;
  final Destination destination;

  const ActivityCard({super.key, required this.activity, required this.day, required this.destination});

  @override
  State<StatefulWidget> createState() => ActivityCardState();
}

class ActivityCardState extends State<ActivityCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () =>  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ActivityForm(
              day: widget.day,
              activity: widget.activity,
              destination: widget.destination,
            ),
          ),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 4,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    widget.activity.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
              Image.network(
                'assets/paris.jpg',
                fit: BoxFit.fill,
                width: double.infinity,
                height: 200,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Adresse",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey
                      ),),
                      Text(widget.activity.address,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Heure de début",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey
                        ),),
                      Text(widget.activity.hour,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Prix",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey
                        ),),
                      Text(widget.activity.price,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Durée",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey
                        ),),
                      Text(widget.activity.duration,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Commentaire",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey
                        ),),
                      Text(widget.activity.comment,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ))
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
