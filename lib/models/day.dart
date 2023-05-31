
import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';



class Day {

  final String id;
  final String comment;
  final String date;
  final String destination_id;
  final String wake_up;

  Day(this.id, this.comment, this.date, this.destination_id, this.wake_up);

  // Méthode pour insérer un utilisateur dans la base de données
  Future<void> insertDay() async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Days');
    await reference.push().set({
      'comment': comment,
      'date': date,
      'destination_id': destination_id,
      'wake_up': wake_up,
    });
  }

  // Méthode pour mettre à jour un utilisateur dans la base de données
  Future<void> updateDay() async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Days').child(id);
    await reference.update({
      'comment': comment,
      'date': date,
      'destination_id': destination_id,
      'wake_up': wake_up,
    });
  }

  // Méthode pour supprimer un utilisateur de la base de données
  Future<void> deleteDays() async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Days').child(id);
    await reference.remove();
  }

  // Méthode pour récupérer un utilisateur spécifique à partir de la base de données
  static Future<Day?> getDay(String dayId) async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Journeys').child(dayId);

    DataSnapshot snapshot = (await reference.once()) as DataSnapshot;
    if (snapshot.value != null) {
      Map<String, dynamic> userData = snapshot.value as Map<String, dynamic>;
      return Day(
        dayId,
        userData['comment'],
        userData['date'],
        userData['destination_id'],
        userData['wake_up'],
      );
    } else {
      return null; // L'utilisateur n'a pas été trouvé
    }
  }

  // Méthode pour récupérer la liste des travels d'un utilisateur
  static Future<List<Day>> getDays(String destinationId) async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Days');

    Query query = reference.orderByChild('destination_id').equalTo(destinationId);
    DatabaseEvent event = await query.once();
    DataSnapshot snapshot = event.snapshot;
    List<Day> dayList = [];


    if (snapshot.value != null) {

      for (DataSnapshot ds in snapshot.children){
        String? key = ds.key;
        print(jsonEncode(ds.value));

        String comment = ds.child('city').value.toString();
        String date = ds.child('comment').value.toString();
        String destination_id = ds.child('end_date').value.toString();
        String wake_up = ds.child('start_date').value.toString();

        dayList.add(Day(
          key!,
          comment,
          date,
          destination_id,
          wake_up,
        ));
      }

    }

    return dayList;
  }

}