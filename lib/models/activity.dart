
import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';



class Activity {

  final String id;
  final String address;
  final String comment;
  final String day_id;
  final String duration;
  final String hour;
  final String price;
  final String title;

  Activity(this.id, this.address, this.comment, this.day_id, this.duration, this.hour, this.price, this.title);

  // Méthode pour insérer un utilisateur dans la base de données
  Future<void> insertActivity() async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Activities');
    await reference.push().set({
      'address': comment,
      'comment': comment,
      'day_id': day_id,
      'duration': duration,
      'hour': hour,
      'price': price,
      'title': title,
    });
  }

  // Méthode pour mettre à jour un utilisateur dans la base de données
  Future<void> updateActivity() async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Activities').child(id);
    await reference.update({
      'address': comment,
      'comment': comment,
      'day_id': day_id,
      'duration': duration,
      'hour': hour,
      'price': price,
      'title': title,
    });
  }

  // Méthode pour supprimer un utilisateur de la base de données
  Future<void> deleteActivities() async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Activities').child(id);
    await reference.remove();
  }

  // Méthode pour récupérer un utilisateur spécifique à partir de la base de données
  static Future<Activity?> getActivity(String activityId) async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Activities').child(activityId);

    DataSnapshot snapshot = (await reference.once()) as DataSnapshot;
    if (snapshot.value != null) {
      Map<String, dynamic> userData = snapshot.value as Map<String, dynamic>;
      return Activity(
        activityId,
        userData['address'],
        userData['comment'],
        userData['day_id'],
        userData['duration'],
        userData['hour'],
        userData['price'],
        userData['title'],
      );
    } else {
      return null; // L'utilisateur n'a pas été trouvé
    }
  }

  // Méthode pour récupérer la liste des travels d'un utilisateur
  static Future<List<Activity>> getActivities(String dayId) async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Activities');

    Query query = reference.orderByChild('day_id').equalTo(dayId);
    DatabaseEvent event = await query.once();
    DataSnapshot snapshot = event.snapshot;
    List<Activity> activityList = [];


    if (snapshot.value != null) {

      for (DataSnapshot ds in snapshot.children){
        String? key = ds.key;
        print(jsonEncode(ds.value));

        String address = ds.child('address').value.toString();
        String comment = ds.child('comment').value.toString();
        String day_id = ds.child('day_id').value.toString();
        String duration = ds.child('duration').value.toString();
        String hour = ds.child('hour').value.toString();
        String price = ds.child('price').value.toString();
        String title = ds.child('title').value.toString();

        activityList.add(Activity(
          key!,
          address,
          comment,
          day_id,
          duration,
          hour,
          price,
          title
        ));
      }

    }

    return activityList;
  }

}