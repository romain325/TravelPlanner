
import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';



class User {

  final String id;
  final String firstname;
  final String password;
  final String username;

  User(this.id, this.firstname, this.password, this.username);

  factory User.fromJson(json){
    return User(
      json['id'],
      json['firstname'],
      json['password'],
      json['username'],
    );
  }

  // Méthode pour insérer un utilisateur dans la base de données
  Future<void> insertUser() async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Users');
    await reference.push().set({
      'firstname': firstname,
      'username': username,
      'password': password,
    });
  }

  // Méthode pour mettre à jour un utilisateur dans la base de données
  Future<void> updateUser() async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Users').child(id);
    await reference.update({
      'firstname': firstname,
      'username': username,
      'password': password,
    });
  }

  // Méthode pour supprimer un utilisateur de la base de données
  Future<void> deleteUser() async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Users').child(id);
    await reference.remove();
  }

  // Méthode pour récupérer un utilisateur spécifique à partir de la base de données
  static Future<User?> getUser(String userId) async {
    DatabaseReference reference =
    FirebaseDatabase.instance.ref().child('Users').child(userId);

    DataSnapshot snapshot = (await reference.once()) as DataSnapshot;
    if (snapshot.value != null) {
      Map<String, dynamic> userData = snapshot.value as Map<String, dynamic>;
      return User(
        userId,
        userData['firstname'],
        userData['username'],
        userData['password'],
      );
    } else {
      return null; // L'utilisateur n'a pas été trouvé
    }
  }

  // Méthode pour récupérer la liste des utilisateurs à partir de la base de données
  static Future<List<User>> getUsers() async {
    DatabaseReference reference = FirebaseDatabase.instance.ref().child('Users');

    DatabaseEvent event = await reference.once();
    DataSnapshot snapshot = event.snapshot;
    List<User> userList = [];


    if (snapshot.value != null) {

      for (DataSnapshot ds in snapshot.children){
        String? key = ds.key;
        print(jsonEncode(ds.value));

        String value = jsonEncode(ds.value);

        String firstname = ds.child('firstname').value.toString();
        String password = ds.child('password').value.toString();
        String username = ds.child('username').value.toString();

        userList.add(User(
          key!,
          firstname,
          password,
          username,
        ));
      }

    }

    return userList;
  }

}