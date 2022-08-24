// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:chat/component/roundedbutton.dart';

class LoginScreen extends StatefulWidget {
  static String ID = 'loginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              //style: TextStyle(color: Colors.black),
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password.')),
            SizedBox(
              height: 24.0,
            ),
            roundedButton(
              co_lor: Colors.lightBlueAccent,
              nextpage: '',
              //  nextpage: () {
              //   Navigator.pushNamed(context, LoginScreen.ID);
              // },
              Title: 'Log In',
            ),
          ],
        ),
      ),
    );
  }
}
