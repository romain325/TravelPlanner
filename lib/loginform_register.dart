import 'package:flutter/material.dart';
import 'delayed_animation.dart';



class LoginForm extends StatefulWidget {

  LoginForm({Key? key, required this.usernameController, required this.passwordController, required this.firstnameController}) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();


  TextEditingController firstnameController;
  TextEditingController usernameController ;
  TextEditingController passwordController ;
}

class _LoginFormState extends State<LoginForm> {
  var _obscureText = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstanameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          SizedBox(height: 70),
          DelayedAnimation(
            delay: 0,
            child: TextField(
              controller: _firstanameController,
              decoration: InputDecoration(
                labelText: 'Firstname',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 35),
          DelayedAnimation(
            delay: 0,
            child: TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          DelayedAnimation(
            delay: 0,
            child: TextField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                ),
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    /*setState(() {
                      _obscureText = !_obscureText;
                    });*/
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}