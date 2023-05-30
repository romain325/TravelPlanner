import 'package:flutter/material.dart';

import '../models/user.dart';
import '../components/user_modal.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<User> userList = [];

  @override
  void initState() {
    super.initState();
    fetchUserList();
  }

  Future<void> fetchUserList() async {
    List<User> users = await User.getUsers();
    setState(() {
      userList = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des utilisateurs'),
      ),
      body: userList.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: userList.length,
        itemBuilder: (BuildContext context, int index) {
          User user = userList[index];
          return GestureDetector(
            onTap: () {
              _showUserDetailsModal(user);
            },
            child: ListTile(
              title: Text(user.firstname),
              subtitle: Text(user.username),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  deleteUser(user);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> deleteUser(User user) async {
    await user.deleteUser();
    fetchUserList();
  }

  Future<void> _showUserDetailsModal(User user) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return UserDetailModal(user: user);
          },
        );
      },
    );
    fetchUserList();
  }

}
