// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class listtile extends StatelessWidget {
  final bool ischecked;
  final String list;
  final Function(bool?) callbackfunction;
  final Function()? lonpress;
  listtile(
      {required this.list,
      required this.ischecked,
      required this.callbackfunction,
      required this.lonpress});

  //void checklist(bool? value) {
  // setState(() {
  //   ischecked = value!;
  // });
  //}

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: lonpress,
      title: Text(
        list,
        style: TextStyle(
            decoration: ischecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: ischecked,
        onChanged: callbackfunction,
      ),
    );
  }
}

// class checkboxx extends StatelessWidget {
//   final bool ischecked;
//   final void Function(bool?)? calllback;
//   checkboxx({required this.ischecked, required this.calllback});

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
