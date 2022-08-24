// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
//import 'package:audioplayers/audioplayers.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(MaterialApp(
    color: Colors.white,
    debugShowCheckedModeBanner: false,
    home: playy(),
  ));
}

class playy extends StatelessWidget {
  const playy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late AudioPlayer player;
    return (Scaffold(
      body: SafeArea(
        child: TextButton(
            onPressed: () async {
              player = AudioPlayer();
              await player.setAsset('assets/note2.wau');
              player.play();
            },
            child: Text('click me')),
      ),
    ));
  }
}
