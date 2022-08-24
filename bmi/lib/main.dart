import 'package:flutter/material.dart';
import 'input.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      appBarTheme: AppBarTheme(color: Color(0xff0A0E21)),
      scaffoldBackgroundColor: Color(0xff0A0E21),
    ).copyWith(), //textTheme: TextTheme(bodyText1: TextStyle(color: Color(0xFFFFFFFF)))),
    debugShowCheckedModeBanner: false,
    home: start(),
  ));
}
