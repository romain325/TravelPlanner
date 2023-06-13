import 'package:flutter/material.dart';
import 'package:flutter_date_picker/flutter_date_picker.dart';
import 'package:travelplanner/destination_page/destination_details.dart';

import '../../day_page/daypage.dart';
import '../../models/day.dart';
import '../../models/destination.dart';

class NewDayForm extends StatefulWidget {
  final Destination destination;
  const NewDayForm({super.key, required this.destination});


  @override
  State<StatefulWidget> createState() => NewDayFormState();
}

class NewDayFormState extends State<NewDayForm> {

  final TextEditingController dateController = TextEditingController();
  final TextEditingController wakeUpTimeController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: dateController,
              decoration: const InputDecoration(
                labelText: 'Date',
                prefixIcon: Icon(Icons.calendar_month)
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: wakeUpTimeController,
              decoration: const InputDecoration(
                labelText: 'Heure du réveil',
                prefixIcon: Icon(Icons.access_time_sharp)
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: commentController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Commentaire',
                prefixIcon: Icon(Icons.comment)
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String date = dateController.text;
                String wakeUpTime = wakeUpTimeController.text;
                String comment = commentController.text;

                Day day = Day(
                  comment: comment,
                  date: date,
                  wake_up: wakeUpTime,
                  destination_id: widget.destination.id,
                ).insertDay() as Day;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DayPage(
                      destination: widget.destination,
                      day: day,
                    ),
                  ),
                );
              },
              child: Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}
