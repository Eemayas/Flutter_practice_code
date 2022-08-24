// ignore_for_file: prefer_const_constructors, unnecessary_this, prefer_interpolation_to_compose_strings

import 'dart:math';

import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  //List check = [];
  int check_winner = 0;
  int check_popup = 0;
  var Cross = Icon(
    Icons.cancel,
    color: Colors.red,
    size: 75,
  );
  var Circle = Icon(
    Icons.circle,
    color: Color.fromARGB(255, 78, 5, 5),
    size: 75,
  );
  var Edit = Icon(
    Icons.check_box_outline_blank_outlined,
    size: 75,
    color: Colors.amberAccent,
  );

  bool iscross = true;
  late String message;
  late List<String> gamestate;

  @override
  void initState() {
    gamestate = List.filled(9, "empty");
    this.message = "";
    super.initState();
  }

  playgame(int index) {
    if (this.gamestate[index] == "empty") {
      setState(() {
        if (this.iscross) {
          this.gamestate[index] = "cross";
        } else {
          this.gamestate[index] = "circle";
        }
        iscross = !iscross;
        checkwin();
      });
    }
  }

  resetgame() {
    setState(() {
      gamestate = List.filled(9, "empty");
      this.message = "";
      iscross = true;
    });
  }

//may be errroe
  Icon get(String title) {
    var re;
    switch (title) {
      case ('empty'):
        re = Edit;
        break;

      case ('cross'):
        re = Cross;
        break;

      case ('circle'):
        re = Circle;
        break;
    }
    return re;
  }

  checkwin() {
    if ((gamestate[0] != "empty") &&
        (gamestate[0] == gamestate[1]) &&
        (gamestate[0] == gamestate[2])) {
      setState(() {
        this.message = '---' + this.gamestate[0] + ' Wins---';
        check_winner = 1;
        check_popup = 1;
      });
    } else if ((gamestate[3] != "empty") &&
        (gamestate[3] == gamestate[4]) &&
        (gamestate[3] == gamestate[5])) {
      setState(() {
        this.message = '---' + this.gamestate[3] + ' Wins---';
        check_winner = 1;
        check_popup = 1;
      });
    } else if ((gamestate[7] != "empty") &&
        (gamestate[7] == gamestate[6]) &&
        (gamestate[7] == gamestate[8])) {
      setState(() {
        this.message = '---' + this.gamestate[7] + ' Wins---';
        check_winner = 1;
        check_popup = 1;
      });
    } else if ((gamestate[0] != "empty") &&
        (gamestate[0] == gamestate[3]) &&
        (gamestate[0] == gamestate[6])) {
      setState(() {
        this.message = '---' + this.gamestate[0] + ' Wins---';
        check_winner = 1;
        check_popup = 1;
      });
    } else if ((gamestate[1] != "empty") &&
        (gamestate[1] == gamestate[4]) &&
        (gamestate[1] == gamestate[7])) {
      setState(() {
        this.message = '---' + this.gamestate[1] + ' Wins---';
        check_winner = 1;
        check_popup = 1;
      });
    } else if ((gamestate[2] != "empty") &&
        (gamestate[2] == gamestate[5]) &&
        (gamestate[2] == gamestate[8])) {
      setState(() {
        this.message = '---' + this.gamestate[2] + ' Wins---';
        check_winner = 1;
        check_popup = 1;
      });
    } else if ((gamestate[0] != "empty") &&
        (gamestate[0] == gamestate[4]) &&
        (gamestate[0] == gamestate[8])) {
      setState(() {
        this.message = '---' + this.gamestate[0] + ' Wins---';
        check_winner = 1;
        check_popup = 1;
      });
    } else if ((gamestate[2] != "empty") &&
        (gamestate[2] == gamestate[4]) &&
        (gamestate[2] == gamestate[6])) {
      setState(() {
        this.message = '---' + this.gamestate[2] + ' Wins---';
        check_winner = 1;
        check_popup = 1;
      });
    } else if (!gamestate.contains("empty")) {
      setState(() {
        message = "Game Draw";
        check_popup = 1;
      });
    }
    if (check_popup == 1) {
      if (check_winner == 1) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "WINNER",
                    style: TextStyle(
                        fontFamily: 'TheNautigal',
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  content: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'TheNautigal',
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        resetgame();
                        Navigator.pop(context);
                      },
                      child: Title(
                        color: Colors.amber,
                        child: Text("Reset Game"),
                      ),
                    ),
                  ],
                ));
        check_winner = 0;
        check_popup = 0;
      } else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "--Draw--",
                    style: TextStyle(
                        fontFamily: 'PressStart2P',
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  content: Text(
                    message,
                    style: TextStyle(fontFamily: 'PressStart2P', fontSize: 34),
                    textAlign: TextAlign.center,
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        resetgame();
                        Navigator.pop(context);
                      },
                      child: Title(
                        color: Colors.amber,
                        child: Text("Reset Game"),
                      ),
                    ),
                  ],
                ));
        check_popup = 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text(
          '---Tic Tac Toe---',
          style: TextStyle(
              fontSize: 30,
              fontFamily: 'Splash',
              color: Colors.redAccent,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: gamestate.length,
              itemBuilder: (context, i) => SizedBox(
                width: 100,
                height: 100,
                child: MaterialButton(
                  onPressed: () {
                    this.playgame(i);
                    //check.add(i);
                  },
                  child: get(this.gamestate[i]),
                ),
              ),
            ),
          ),
          Text(
            message,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Splash'),
          ),
          Container(
            child: MaterialButton(
              color: Colors.black,
              onPressed: () {
                resetgame();
              },
              child: Text(
                'Reset Game',
                style:
                    TextStyle(color: Colors.red, fontFamily: 'PermanentMarker'),
              ),
            ),
          ),
          Text(
            "Developed by: Ee Ma Yas",
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Splash',
              color: Colors.amber,
            ),
          )
        ],
      ),
    );
  }
}
