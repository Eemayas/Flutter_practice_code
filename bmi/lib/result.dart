// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'reuse.dart';
import 'input.dart';
// import 'calculate.dart';

class result extends StatelessWidget {
  result(
      {required this.interpretation,
      required this.bmiResult,
      required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(title: Text("Calculator")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              width: double.infinity,
              child: Text(
                "YOUR RESULT",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )),
            Expanded(
                flex: 5,
                child: Reuse(
                  colour: Colors.grey.shade700,
                  ccard: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          resultText,
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          bmiResult,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 100),
                        ),
                        Text(
                          interpretation,
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ]),
                )),
            buttomwidget(
                onTap: () {
                  Navigator.of(context).pop();
                },
                teext: 'RE-CALCULATED')
          ],
        )));
  }
}
