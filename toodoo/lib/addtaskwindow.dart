// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toodoo/task_data.dart';

import 'model/task.dart';

class addtask extends StatelessWidget {
  late String newtask;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ADD TASK',
                  style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25),
                ),
                TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  decoration:
                      InputDecoration(hoverColor: Colors.lightBlueAccent),
                  onChanged: (newvalue) {
                    newtask = newvalue;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.lightBlueAccent,
                  child: TextButton(
                      onPressed: () {
                        Provider.of<taskdata>(context, listen: false)
                            .addtassk(newtask);
                        Navigator.pop(context);
                      },
                      child:
                          Text('ADD', style: TextStyle(color: Colors.white))),
                )
              ]),
        ),
      ),
    );
  }
}
