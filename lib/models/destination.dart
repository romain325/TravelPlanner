
import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';



class Destination {

  final String id;
  final String city;
  final String comment;
  final String end_date;
  final String start_date;
  final String travel_id;

  Destination(this.id, this.city, this.comment, this.end_date, this.start_date, this.travel_id);

  // Méthode pour insérer un utilisateur dans la base de données
  Future<void> insertDestination() async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Destinations');
    await reference.push().set({
      'city': city,
      'comment': comment,
      'end_date': end_date,
      'start_date': start_date,
      'travel_id': travel_id,
    });
  }

  // Méthode pour mettre à jour un utilisateur dans la base de données
  Future<void> updateDestination() async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Destinations').child(id);
    await reference.update({
      'city': city,
      'comment': comment,
      'end_date': end_date,
      'start_date': start_date,
      'travel_id': travel_id,
    });
  }

  // Méthode pour supprimer un utilisateur de la base de données
  Future<void> deleteDestinations() async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Destinations').child(id);
    await reference.remove();
  }

  // Méthode pour récupérer un utilisateur spécifique à partir de la base de données
  static Future<Destination?> getDestination(String destinationId) async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Destinations').child(destinationId);

    DataSnapshot snapshot = (await reference.once()) as DataSnapshot;
    if (snapshot.value != null) {
      Map<String, dynamic> userData = snapshot.value as Map<String, dynamic>;
      return Destination(
        destinationId,
        userData['city'],
        userData['comment'],
        userData['end_date'],
        userData['start_date'],
        userData['travel_id'],
      );
    } else {
      return null; // L'utilisateur n'a pas été trouvé
    }
  }

  // Méthode pour récupérer la liste des travels d'un utilisateur
  static Future<List<Destination>> getDestinations(String travelId) async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Destinations');

    Query query = reference.orderByChild('travel_id').equalTo("0");
    DatabaseEvent event = await query.once();
    DataSnapshot snapshot = event.snapshot;
    List<Destination> destinationList = [];


    if (snapshot.value != null) {

      for (DataSnapshot ds in snapshot.children){
        String? key = ds.key;

        String city = ds.child('city').value.toString();
        String comment = ds.child('comment').value.toString();
        String end_date = ds.child('end_date').value.toString();
        String start_date = ds.child('start_date').value.toString();
        String travel_id = ds.child('travel_id').value.toString();

        destinationList.add(Destination(
          key!,
          city,
          comment,
          end_date,
          start_date,
          travel_id,
        ));
      }

    }
    return destinationList;
  }

}