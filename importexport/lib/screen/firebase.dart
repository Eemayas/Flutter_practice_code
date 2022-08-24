import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class firebase_service {
  void Insert() async {
    CollectionReference snapshot =
        FirebaseFirestore.instance.collection('chat');
    //add the document/text in the firebase nad return the patha
    // snapshot.add({"data": "1st try"}).then((value) {
    //   print(value.path);
    //});

    //delete the passed docs path in below the pasth is "cDgTtEM2jUWGoD0tM9Dw"
    // await snapshot.doc("cDgTtEM2jUWGoD0tM9Dw").delete();

    // add mapp to the firebase
    Map<String, dynamic> outdata = {
      "key": "value",
      "key1": "value1",
      "key2": "value2",
      "check": true, //passed boolean type data type
    };
    Map<String, Map> outdata_Map = {
      "key": {"data": "data"},
      "key1": {"data1": "data1"}
    };
    Map<String, List> outdata_List = {
      "key": ["hello", "eee", "prashant"],
      "key1": ["hello", "eee", "scsc"],
      //passed boolean type data type
    };
    Map<String, dynamic> outdata_alldatatype = {
      "key": ["hello", "eee", "prashant"], //list

      "key1": true, //boolena
      "key2": {"data": "data"}, //map
      "key3": 20.0, // number
      "key4": "value1", //string

      //passed boolean type data type
    };

    // // add mapp to the firebase of doc id automatically generated
    // //await snapshot.add(outdata);

    // ////add map to firebase with costum id
    // // await snapshot
    // //     .doc("9860440088888")
    // //     .set(outdata_Map)
    // //     .then((value) => print("sucess"));
    // // await snapshot
    // //     .doc("list")
    // //     .set(outdata_List)
    // //     .then((value) => print("sucess"));

// //to update the passed data ,the chnaged data cna only be send to the firebase
//     Map<String, List> outdata_List_update = {
//       "key1": ["try111", "eee", "prashant"],

// };
//     //change/upadate the uplaoded data in firebase
//     await snapshot
//         .doc("list")
//         .update(outdata_List_update)
//         .then((value) => print("sucess"));
    await snapshot
        .doc("alldata")
        .set(outdata_alldatatype)
        .then((value) => print("sucess"));
  }

  void Insert_in_subcollection() async {
    var db = FirebaseFirestore.instance.collection("chat");
    db
        .doc("Prashant")
        .collection("9860440088")
        .doc("try")
        .set({"data": "EEE"}).then((value) => print("sucesss"));
  }
}
