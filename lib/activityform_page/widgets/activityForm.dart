import 'package:flutter/material.dart';
import 'package:flutter_date_picker/flutter_date_picker.dart';
import 'package:travelplanner/destination_page/destination_details.dart';

import '../../day_page/daypage.dart';
import '../../models/activity.dart';
import '../../models/day.dart';
import '../../models/destination.dart';

class ActivityForm extends StatefulWidget {
  final Day day;
  final Activity activity;
  final Destination destination;

  const ActivityForm({super.key, required this.day, required this.activity, required this.destination});

  @override
  State<StatefulWidget> createState() => ActivityFormState();
}

class ActivityFormState extends State<ActivityForm> {
  final TextEditingController titreController = TextEditingController();
  final TextEditingController adresseController = TextEditingController();
  final TextEditingController horaireController = TextEditingController();
  final TextEditingController dureeController = TextEditingController();
  final TextEditingController prixController = TextEditingController();
  final TextEditingController commentaireController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: titreController,
              decoration: const InputDecoration(
                  labelText: 'Titre', prefixIcon: Icon(Icons.calendar_month)),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: adresseController,
              decoration: const InputDecoration(
                  labelText: 'Adresse',
                  prefixIcon: Icon(Icons.local_post_office_outlined)),
            ),
            const SizedBox(height: 16.0),
            Row(children: [
              TextFormField(
                controller: horaireController,
                decoration: const InputDecoration(
                    labelText: 'Horaire', prefixIcon: Icon(Icons.access_time_sharp)),
              ),
              TextFormField(
                controller: dureeController,
                decoration: const InputDecoration(
                    labelText: 'Durée', prefixIcon: Icon(Icons.timer_outlined)),
              ),
            ]),
            TextFormField(
              controller: prixController,
              decoration: const InputDecoration(
                  labelText: 'Prix', prefixIcon: Icon(Icons.euro_symbol_sharp)),
            ),
            TextFormField(
              controller: commentaireController,
              maxLines: 3,
              decoration: const InputDecoration(
                  labelText: 'Commentaire', prefixIcon: Icon(Icons.comment)),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String titre = titreController.text;
                String adresse = adresseController.text;
                String horaire = horaireController.text;
                String duree = dureeController.text;
                String prix = prixController.text;
                String commentaire = commentaireController.text;

                Activity activity = Activity(
                  title: titre,
                  address: adresse,
                  hour: horaire,
                  duration: duree,
                  price: prix,
                  comment: commentaire,
                  day_id: widget.day.id,
                ).insertActivity() as Activity;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DayPage(day: widget.day, destination: widget.destination),

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
