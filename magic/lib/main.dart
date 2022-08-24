// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: homee(),
  ));
}

class homee extends StatelessWidget {
  const homee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Ask Me Anything'),
          backgroundColor: Colors.blue.shade900,
        ),
        body: picture());
  }
}

class picture extends StatefulWidget {
  const picture({Key? key}) : super(key: key);

  @override
  State<picture> createState() => _pictureState();
}

class _pictureState extends State<picture> {
  int num = 1;
  @override
  Widget build(BuildContext context) {
    return (Container(
      alignment: Alignment.center,
      child: TextButton(
          onPressed: () {
            setState(() {
              num = Random().nextInt(5) + 1;
            });
          },
          child: Image.asset('assests/images/ball$num.png')),
    ));
  }
}
