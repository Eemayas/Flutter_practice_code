//https://www.youtube.com/watch?v=T-3aPrKQCng
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:importexport/screen/bucket.firestore.dart';
import 'package:importexport/screen/field.firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class document extends StatelessWidget {
  const document({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: StreamBuilder(
          /// connecteted to the pathhof the neeeded collection
          stream: FirebaseFirestore.instance
              .collection(firestore_bucket.Tutorial)
              .snapshots(),

          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              print("total document : ${snapshot.data!.docs.length}");
              if (snapshot.data!.docs.isNotEmpty) {
                return ListView.separated(
                    itemBuilder: (_, int index) {
                      Map<String, dynamic> datastore =
                          snapshot.data!.docs[index].data();
                      if (datastore.isEmpty) {
                        return Text(
                          "NOT document",
                          style: TextStyle(fontSize: 50),
                        );
                      }
//getting data and savinf in step 1
                      // String key = snapshot.data!.docs
                      //     .elementAt(index)
                      //     .get(firebase_field.key);
                      // String key1 = snapshot.data!.docs
                      //     .elementAt(index)
                      //     .get(firebase_field.key1);

//step 2
                      String key = datastore[firebase_field.key];
                      String key1 = datastore[firebase_field.key1];
                      return ListTile(
                        title: Text(key),
                        subtitle: Text(key1),
                      );
                    },
                    separatorBuilder: (___, ____) {
                      return const Divider();
                    },
                    itemCount: snapshot.data!.docs[1].data().length);
              } else {
                return Text(
                  "NOT document",
                  style: TextStyle(fontSize: 40),
                );
              }
            } else {
              return Center(
                child: Text(
                  "error",
                  style: TextStyle(fontSize: 30),
                ),
              );
            }
          },
        ),
      )),
    );
  }
}
