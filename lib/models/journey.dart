
import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';



class Journey {

  final String id;
  final String city;
  final String comment;
  final String date;
  final String hour;
  final String place;
  final String travel_id;

  Journey(this.id, this.city, this.comment, this.date, this.hour, this.place, this.travel_id);

  // Méthode pour insérer un utilisateur dans la base de données
  Future<void> insertJourney() async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Journeys');
    await reference.push().set({
      'city': city,
      'comment': comment,
      'date': date,
      'hour': hour,
      'place': place,
      'travel_id': travel_id,
    });
  }

  // Méthode pour mettre à jour un utilisateur dans la base de données
  Future<void> updateJourney() async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Journeys').child(id);
    await reference.update({
      'city': city,
      'comment': comment,
      'date': date,
      'hour': hour,
      'place': place,
      'travel_id': travel_id,
    });
  }

  // Méthode pour supprimer un utilisateur de la base de données
  Future<void> deleteJourney() async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Journeys').child(id);
    await reference.remove();
  }

  // Méthode pour récupérer un utilisateur spécifique à partir de la base de données
  static Future<Journey?> getJourney(String journeyId) async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Journeys').child(journeyId);

    DataSnapshot snapshot = (await reference.once()) as DataSnapshot;
    if (snapshot.value != null) {
      Map<String, dynamic> userData = snapshot.value as Map<String, dynamic>;
      return Journey(
        journeyId,
        userData['city'],
        userData['comment'],
        userData['date'],
        userData['hour'],
        userData['place'],
        userData['travel_id'],
      );
    } else {
      return null; // L'utilisateur n'a pas été trouvé
    }
  }

  // Méthode pour récupérer la liste des travels d'un utilisateur
  static Future<List<Journey>> getJourneys(String travelId) async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Journeys');

    Query query = reference.orderByChild('travel_id').equalTo(travelId);
    DatabaseEvent event = await query.once();
    print(event.snapshot.value);
    DataSnapshot snapshot = event.snapshot;
    List<Journey> journeyList = [];


    if (snapshot.value != null) {

      for (DataSnapshot ds in snapshot.children){
        String? key = ds.key;
        print(jsonEncode(ds.value));

        String city = ds.child('city').value.toString();
        String comment = ds.child('comment').value.toString();
        String date = ds.child('date').value.toString();
        String hour = ds.child('hour').value.toString();
        String place = ds.child('place').value.toString();
        String travel_id = ds.child('travel_id').value.toString();

        journeyList.add(Journey(
          key!,
          city,
          comment,
          date,
          hour,
          place,
          travel_id,
        ));
      }

    }

    return journeyList;
  }

}