//https://docs.flutter.dev/cookbook/networking/fetch-data

// https://medium.com/flutter-community/build-a-wallpaper-app-with-flutter-85720dbf8e28

// https://unsplash.com/documentation#get-a-photo

// https://api.unsplash.com/photos/?client_id=yDKupPw4fdGY53hdQNe5WJf-BCmhdSweoOcKV2zjOEA#&collections/:id:206

// https://api.unsplash.com/collections/206?client_id=yDKupPw4fdGY53hdQNe5WJf-BCmhdSweoOcKV2zjOEA

// https://api.unsplash.com/photos/241bwQl2uWE/?client_id=yDKupPw4fdGY53hdQNe5WJf-BCmhdSweoOcKV2zjOEA

// https://api.unsplash.com/photos//?client_id=yDKupPw4fdGY53hdQNe5WJf-BCmhdSweoOcKV2zjOEA
import 'package:http/http.dart';

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String Api_Key = "563492ad6f9170000100000195320dc341ed44ec83ccd3a7cdb1b218";
Future<List> fetchAlbum() async {
  final response = await http.get(Uri.parse(
      'https://api.unsplash.com/photos//?client_id=yDKupPw4fdGY53hdQNe5WJf-BCmhdSweoOcKV2zjOEA'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //return Album.AlbumList(jsonDecode(response.body));
    // return Album.fromJson(jsonDecode(response.body));
    List<dynamic> Listtt = [];
    for (int i = 0; i < jsonDecode(response.body).length; i++) {
      Listtt.add(Album.fromJson(jsonDecode(response.body), i));
    }
    return Listtt;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album ${response.statusCode}');
  }
}

class Album {
  // final int userId;
  final String id;
  final String FullImg;

  const Album({
    required this.FullImg,
    required this.id,
  });

  factory Album.fromJson(List<dynamic> json, int i) {
    return Album(
      FullImg: json[i]['urls']['full'] ?? "error",
      id: json[i]['id'],
    );
  }
}

// void main() => runApp(const MyApp());

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late Future<Album> futureAlbum;

//   @override
//   void initState() {
//     super.initState();
//     futureAlbum = fetchAlbum();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<Album>(
//             future: futureAlbum,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text(snapshot.data!.title);
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }

//               // By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
