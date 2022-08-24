import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(
    MaterialApp(
      title: "tic tac toe",
      //theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: homepage(),
    ),
  );
}
