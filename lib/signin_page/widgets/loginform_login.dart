import 'package:flutter/material.dart';
import '../../delayed_animation.dart';
import 'dart:async';


class LoginForm extends StatelessWidget {
  var _obscureText = true;
  LoginForm({Key? key, required this.emailController, required this.passwordController});
  TextEditingController emailController ;
  TextEditingController passwordController ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          DelayedAnimation(
            delay: 500,
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          DelayedAnimation(
            delay: 500,
            child: TextField(
              controller: passwordController,
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