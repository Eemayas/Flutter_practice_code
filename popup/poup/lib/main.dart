// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "pop up",
      debugShowCheckedModeBanner: false,
      home: popup(),
    ),
  );
}

class popup extends StatefulWidget {
  @override
  State<popup> createState() => _popupState();
}

class _popupState extends State<popup> {
  String messeage = "crosss has win";
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: Text('Pop up'),
        ),
        body: ElevatedButton(
          child: Text('click me'),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(
                        "WINNER",
                        textAlign: TextAlign.center,
                      ),
                      content: Text(messeage),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {},
                          child: Title(
                            color: Colors.amber,
                            child: Text("Reset Game"),
                          ),
                        ),
                      ],
                    ));
          },
        )));
  }
}
