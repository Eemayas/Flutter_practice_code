// ignore_for_file: prefer_const_constructors, unused_local_variable
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: start(),
  ));
}

class start extends StatefulWidget {
  const start({Key? key}) : super(key: key);

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  int left = 5;
  var right = 1;

  void change() {
    setState(() {
      left = Random().nextInt(6) + 1;
      right = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text(
            "Dice",
            textAlign: TextAlign.center,
          )),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  change();
                },
                child: Image.asset('images/dice$left.png'),
              ),
            ),
            Expanded(
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      change();
                    });
                  },
                  child: Image.asset('images/dice$right.png')),
            ),
          ],
        ),
      ),
    ));
  }
}
