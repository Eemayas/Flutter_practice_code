import 'package:flutter/material.dart';
import 'package:importexport/screen/firebase.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  firebase_service().Insert();
                },
                height: 30,
                color: Colors.amberAccent,
                minWidth: 200,
                child: Text("INSERT in collection"),
              ),
              SizedBox(height: 40),
              MaterialButton(
                onPressed: () {
                  firebase_service().Insert_in_subcollection();
                },
                height: 30,
                color: Colors.amberAccent,
                minWidth: 200,
                child: Text("INSERT in subcollection"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
