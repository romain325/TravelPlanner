
import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';



class Day {

  final String id;
  final String comment;
  final String date;
  final String destination_id;
  final String wake_up;
  int? activity_count = 0;

  Day({required this.comment, required this.date, required this.destination_id, required this.wake_up, this.activity_count = 0, this.id = ""});

  // Méthode pour insérer un utilisateur dans la base de données
  Future<Day> insertDay() async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Days');
    await reference.push().set({
      'comment': comment,
      'date': date,
      'destination_id': destination_id,
      'wake_up': wake_up,
    });

    return this;
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
    FirebaseDatabase.instance.ref().child('Days').child(dayId);

    DataSnapshot snapshot = (await reference.once()) as DataSnapshot;
    if (snapshot.value != null) {
      Map<String, dynamic> userData = snapshot.value as Map<String, dynamic>;
      return Day(
        id: dayId,
        comment: userData['comment'],
        date: userData['date'],
        destination_id: userData['destination_id'],
        wake_up: userData['wake_up'],
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

        int activityCount = await getActivityCount(key!);
        String comment = ds.child('comment').value.toString();
        String date = ds.child('date').value.toString();
        String destination_id = ds.child('destination_id').value.toString();
        String wake_up = ds.child('wake_up').value.toString();

        dayList.add(Day(
          id: key!,
          comment: comment,
          date: date,
          destination_id: destination_id,
          wake_up: wake_up,
          activity_count: activityCount
        ));
      }

    }

    return dayList;
  }

  static Future<int> getActivityCount(String dayId) async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Activities');

    Query query = reference.orderByChild('day_id').equalTo(dayId);
    DatabaseEvent event = await query.once();
    DataSnapshot snapshot = event.snapshot;

    int i = 0;
    for(DataSnapshot ds in snapshot.children){
      i++;
    }

    return i;

  }

}