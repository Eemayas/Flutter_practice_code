// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(ScoreApp());
}

// ignore: use_key_in_widget_constructors
class ScoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Score App",
      home: Scorehome(),
    );
  }
}

class Scorehome extends StatefulWidget {
  @override
  State<Scorehome> createState() => _ScorehomeState();
}

class _ScorehomeState extends State<Scorehome> {
  int number = 0;
  void increasenumber() {
    setState(() {
      number++;
    });
  }

  void decreasenumber() {
    setState(() {
      number--;
    });
  }

  void resetnumber() {
    setState(() {
      number = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Score App"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore_outlined),
        onPressed: resetnumber,
      ),
      body: Column(children: [
        SizedBox(
          height: 30,
        ),
        Center(
            child: Text("Score is",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.green,
                    fontWeight: FontWeight.bold))),
        Center(
            child: Text(number.toString(),
                style: TextStyle(fontSize: 85, color: Colors.green))),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(
                'Increase',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: increasenumber,
            ),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              // ignore: sort_child_properties_last
              child: Text(
                'Decrease',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: decreasenumber,
            )
          ],
        ),
      ]),
    );
  }
}
