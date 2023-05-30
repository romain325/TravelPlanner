import 'dart:html';

import 'package:flutter/material.dart';
import 'package:travelplanner/models/user.dart';

class UserDetailModal extends StatefulWidget {
  final User user;

  UserDetailModal({required this.user});

  @override
  _UserDetailModalState createState() => _UserDetailModalState();
}

class _UserDetailModalState extends State<UserDetailModal> {
  late TextEditingController firstnameController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    firstnameController = TextEditingController(text: widget.user.firstname);
    usernameController = TextEditingController(text: widget.user.username);
    passwordController = TextEditingController(text: widget.user.password);
  }

  @override
  void dispose() {
    firstnameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Détails de l\'utilisateur',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: firstnameController,
              decoration: InputDecoration(labelText: 'Nom complet'),
            ),
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Nom d\'utilisateur'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Fermer'),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    updateUser();
                  },
                  child: Text('Enregistrer'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updateUser() async {
    String newFirstname = firstnameController.text;
    String newUsername = usernameController.text;
    String newPassword = passwordController.text;

    User updatedUser = User(
      widget.user.id,
      newFirstname,
      newUsername,
      newPassword,
    );

    await updatedUser.updateUser();

    Navigator.of(context).pop();
  }
}
