// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

late User logInUser;

class ChatScreen extends StatefulWidget {
  static String ID = 'chatScreen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messagetextcontroller = TextEditingController();
  CollectionReference UUser = FirebaseFirestore.instance.collection('messages');
  Stream collectionStream =
      FirebaseFirestore.instance.collection('messages').snapshots();

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
    DateTime time = DateTime.now();
    return UUser.add({'Text': mmmm, 'SENDER': email, 'time': time})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

// //print single part
//   void getmessage() async {
//     final message = await UUser.doc('BEk0T5s3WTB9IX5GXMZc').get();
//     print(message['Text']);
//   }

// //print whole part
//   void messagesbunch() async {
//     UUser.get().then((QuerySnapshot querySnapshot) {
//       querySnapshot.docs.forEach((doc) {
//         print(doc.data());
//       });
//     });
//   }

//   void streammessage() {
//     FirebaseFirestore.instance
//         .collection('messages')
//         .snapshots()
//         .listen((QuerySnapshot querySnapshot) {
//       querySnapshot.docs.forEach((doc) => print(doc.data()));
//     });
//   }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //getmessage();
                //streammessage();
                //messagestream();
                _auth.signOut();
                Navigator.pop(context);
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
            messageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messagetextcontroller,
                      onChanged: (value) {
                        messsagetext = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  // ignore: deprecated_member_use
                  ElevatedButton(
                    onPressed: () {
                      messagetextcontroller.clear();
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

class bubble extends StatelessWidget {
  bubble({required this.message, required this.email, required this.isMe});
  final String message;
  final String email;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(email, style: TextStyle(color: Colors.black54, fontSize: 10)),
          Material(
            elevation: 6,
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                : BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
            color: isMe ? Colors.lightBlueAccent : Colors.white70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                '$message ',
                style: TextStyle(
                    color: isMe ? Colors.white : Colors.black, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class messageStream extends StatelessWidget {
  const messageStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('messages')
          .orderBy('time')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        List<bubble> messagelist = [];
        if (snapshot.hasData) {
          final message = snapshot.data?.docs.reversed;

          for (var mssg in message!) {
            final msgtext = mssg['Text'];
            final msgsender = mssg['SENDER'];
            final currentuserlogin = logInUser.email;
            final msgwidget = bubble(
              message: msgtext,
              email: msgsender,
              isMe: currentuserlogin == msgsender,
            );
            messagelist.add(msgwidget);
          }
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: messagelist,
          ),
        );
      },
    );
  }
}
