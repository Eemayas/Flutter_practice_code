// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:toodoo/task_data.dart';
import 'taskwindow.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MYAPP());
}

class MYAPP extends StatelessWidget {
  const MYAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return taskdata();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: taskwindow(),
      ),
    );
  }
}
