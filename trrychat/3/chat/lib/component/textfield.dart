import 'package:flutter/material.dart';

class text_field extends StatelessWidget {
  text_field({required this.onchanged, required this.hinttext});
  final String hinttext;
  final Function onchanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      //style: TextStyle(color: Colors.black),
      onChanged: onchanged(),
      decoration: InputDecoration(
        hintText: hinttext,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
