import 'package:flutter/material.dart';

class taskwindow extends StatelessWidget {
  const taskwindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        padding: EdgeInsets.only(top: 100, bottom: 30, left: 30, right: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.list,
              size: 30.0,
              color: Colors.lightBlueAccent,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'To Do ',
            style: TextStyle(
                fontSize: 50, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          Text(
            '12 Task ',
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.w400),
          )
        ]),
      ),
    );
  }
}
