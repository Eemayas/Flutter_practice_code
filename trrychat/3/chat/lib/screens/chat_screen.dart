// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatScreen extends StatefulWidget {
  static String ID = 'chatScreen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  CollectionReference UUser = FirebaseFirestore.instance.collection('messages');
  Stream collectionStream =
      FirebaseFirestore.instance.collection('messages').snapshots();
  late User logInUser;
  late String messsagetext;
  final _auth = FirebaseAuth.instance;
  void getCurrentUser() async {
    try {
      final User? user = _auth.currentUser;
      final uid = user?.uid;
      if (user != null) {
        logInUser = user;
        print(logInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> addUser(String mmmm, String? email) {
    return UUser.add({'Text': mmmm, 'SENDER': email})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

//print single part
  void getmessage() async {
    final message = await UUser.doc('BEk0T5s3WTB9IX5GXMZc').get();
    print(message['Text']);
  }

//print whole part
  void messagesbunch() async {
    UUser.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc.data());
      });
    });
  }

  void streammessage() {
    FirebaseFirestore.instance
        .collection('messages')
        .snapshots()
        .listen((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) => print(doc.data()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //getmessage();
                streammessage();
                //messagestream();
                // _auth.signOut();
                // Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        messsagetext = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: () {
                      try {
                        addUser(messsagetext, logInUser.email);
                        //GetUserName('BEk0T5s3WTB9IX5GXMZc');
                      } catch (e) {
                        print(e);
                      }

                      //Implement send functionality.
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
