import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

DatabaseReference database = FirebaseDatabase.instance.ref();

class DestinationPage extends StatefulWidget {
  const DestinationPage({super.key});

  @override
  State<StatefulWidget> createState() => DestinationPageState();

}

class DestinationPageState extends State<DestinationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
        const Text("Talk to myself", style: TextStyle(color: Colors.black)),
      ),
      body: Center(
          child: IconButton(
              onPressed: () {
                addUser();
              },
              icon: const Icon(Icons.send))
      ),
    );
  }

}

void addUser() {
  Map<String, dynamic> data = {
    "firstname": "Romain",
    "username": "r.olivier",
    "password": "password"
  };

  database.child("Users").push().set(data);
}