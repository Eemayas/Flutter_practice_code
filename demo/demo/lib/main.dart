import 'package:demo/loginpage1/newuser.dart';
import 'package:flutter/material.dart';
import 'loginpage1/loginpage.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      title: 'demo',
      initialRoute: loginpage1.ID,
      routes: {
        loginpage1.ID: (context) => loginpage1(),
        newuser1.ID: (context) => new newuser1(),
      },
    );
  }
}
