// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:chat/screens/welcome_screen.dart';
import 'package:chat/screens/login_screen.dart';
import 'package:chat/screens/registration_screen.dart';
import 'package:chat/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        inputDecorationTheme:
            InputDecorationTheme(hintStyle: TextStyle(color: Colors.black54)),
        textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.black),
          subtitle2: TextStyle(color: Colors.black),
        ),
      ),
      initialRoute: WelcomeScreen.ID,
      //home: WelcomeScreen(),
      routes: {
        WelcomeScreen.ID: (context) => WelcomeScreen(),
        ChatScreen.ID: (context) => ChatScreen(),
        LoginScreen.ID: (context) => LoginScreen(),
        RegistrationScreen.ID: (context) => RegistrationScreen(),
      },
    );
  }
}
