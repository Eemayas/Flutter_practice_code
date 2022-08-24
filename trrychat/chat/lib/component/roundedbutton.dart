import 'package:chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class roundedButton extends StatelessWidget {
  roundedButton(
      {required this.nextpage, required this.Title, required this.co_lor});
  final String nextpage;
  final String Title;
  final Color co_lor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: co_lor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, nextpage);
            //Go to login screen.
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            Title,
          ),
        ),
      ),
    );
  }
}
