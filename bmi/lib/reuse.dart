import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const heightstyle =
    TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.w900);

class firstcolumn extends StatelessWidget {
  final String firstcolumntext;
  firstcolumn(
      {this.firstcolumntext = 'male',
      this.firstcolumnicon = FontAwesomeIcons.a});
  final IconData firstcolumnicon;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        firstcolumnicon,
        size: 80,
        color: Colors.white,
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        firstcolumntext,
        style: TextStyle(color: Colors.white, fontSize: 18),
      )
    ]);
  }
}

class Reuse extends StatelessWidget {
  Reuse({required this.colour, this.ccard});
  final Color colour;
  final Widget? ccard;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration:
          BoxDecoration(color: colour, borderRadius: BorderRadius.circular(10)),
      child: ccard,
    );
  }
}
