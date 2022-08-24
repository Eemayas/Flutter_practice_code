// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    App(),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  _launchURLApp(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
          backgroundColor: Colors.teal,
          body: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 75.0,
                backgroundImage: AssetImage('images/photo.jpg'),
              ),
              Text(
                'Prashant Manandhar',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Splash'),
              ),
              Text(
                'STUDENT',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Lobster',
                  color: Colors.teal.shade900,
                ),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
              ),
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(Icons.phone, color: Colors.teal.shade900),
                    title: Text(
                      '+977 9860440088',
                      style: TextStyle(
                          fontFamily: 'Lobster',
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade900),
                    ),
                  )),
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(Icons.email, color: Colors.teal.shade900),
                    title: Text(
                      'prashantmanandhar2002@gmail.com',
                      style: TextStyle(
                          fontFamily: 'Lobster',
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade900),
                    ),
                  )),
              Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ListTile(
                      leading:
                          Icon(Icons.pin_drop, color: Colors.teal.shade900),
                      title: Text(
                        'Banepa,Nepal',
                        style: TextStyle(
                            fontFamily: 'Lobster',
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade900),
                      ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      color: Colors.teal,
                      child: ElevatedButton(
                        onPressed: () {
                          _launchURLApp(
                              "https://www.facebook.com/prashant.manandhar.88/");
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(75, 75),
                          shape: const CircleBorder(),
                        ),
                        child: Icon(Icons.facebook),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      color: Colors.teal,
                      child: ElevatedButton(
                        onPressed: () {
                          _launchURLApp(
                              "https://www.facebook.com/prashant.manandhar.88/");
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(75, 75),
                          shape: const CircleBorder(),
                        ),
                        child: Icon(Icons.whatsapp),
                      )),
                ],
              )
            ],
          ))),
    ));
  }
}
