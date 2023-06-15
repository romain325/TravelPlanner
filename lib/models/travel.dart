
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';



class Travel {

  final String id;
  final String arrival;
  final String departure;
  final String end_date;
  final String start_date;
  final String title;
  final String user_id;

  Travel(this.id, this.arrival, this.departure, this.end_date, this.start_date, this.title, this.user_id);

  // Méthode pour insérer un utilisateur dans la base de données
  Future<void> insertTravel() async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Travels');
    await reference.push().set({
      'arrival': arrival,
      'departure': departure,
      'end_date': end_date,
      'start_date': start_date,
      'title': title,
      'user_id': user_id,
    });
  }

  // Méthode pour mettre à jour un utilisateur dans la base de données
  Future<void> updateTravel() async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Travels').child(id);
    await reference.update({
      'arrival': arrival,
      'departure': departure,
      'end_date': end_date,
      'start_date': start_date,
      'title': title,
      'user_id': user_id,
    });
  }

  // Méthode pour supprimer un utilisateur de la base de données
  Future<void> deleteTravel() async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Travels').child(id);
    await reference.remove();
  }

  // Méthode pour récupérer un utilisateur spécifique à partir de la base de données
  static Future<Travel?> getTravel(String travelId) async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Travels').child(travelId);

    DatabaseEvent event = await reference.once();
    if(event.type == DatabaseEventType.value) {
        Map<String, dynamic> userData = event.snapshot.value as Map<String, dynamic>;
        return Travel(
          travelId,
          userData['arrival'],
          userData['departure'],
          userData['end_date'],
          userData['start_date'],
          userData['title'],
          userData['user_id'],
        );
    }
    return null;
  }

  // Méthode pour récupérer la liste des travels d'un utilisateur
  static Future<List<Travel>> getTravels(String userId) async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Travels');

    Query query = reference.orderByChild('user_id').equalTo(userId);
    DatabaseEvent event = await query.once();
    DataSnapshot snapshot = event.snapshot;
    List<Travel> travelList = [];


    if (snapshot.value != null) {

      for (DataSnapshot ds in snapshot.children){
        String? key = ds.key;

        String arrival = ds.child('arrival').value.toString();
        String departure = ds.child('departure').value.toString();
        String end_date = ds.child('end_date').value.toString();
        String start_date = ds.child('start_date').value.toString();
        String title = ds.child('title').value.toString();
        String user_id = ds.child('user_id').value.toString();

        travelList.add(Travel(
          key!,
          arrival,
          departure,
          end_date,
          start_date,
          title,
          user_id,
        ));
      }

    }

    return travelList;
  }

  @override
  String toString() {
    return 'Travel{id: $id, arrival: $arrival, departure: $departure, end_date: $end_date, start_date: $start_date, title: $title, user_id: $user_id}';
  }
}