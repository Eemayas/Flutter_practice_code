import 'package:demo/loginpage1/loginpage.dart';
import 'package:flutter/material.dart';

class newuser1 extends StatefulWidget {
  static String ID = "login1";
  @override
  State<newuser1> createState() => _newuser1State();
}

class _newuser1State extends State<newuser1> {
  var currentFocus;
  unfocus() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: unfocus,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff05404A), Color(0xff1F7A7B)])),
          child: ListView(
            children: [
              Column(
                children: [
                  Row(children: [
                    SingUp(),
                    TextNew(),
                  ]),
                  newname(),
                  newemail(),
                  passwordbox(),
                  birth(),
                  okbutton(),
                  prevuser(),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}

class SingUp extends StatelessWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 60, left: 10),
        child: RotatedBox(
            quarterTurns: -1,
            child: Text(
              "SIGN Up",
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.w900,
              ),
            )));
  }
}

class TextNew extends StatelessWidget {
  const TextNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.0, left: 10.0),
      child: Container(
        height: 200,
        width: 175,
        child: Column(
          children: [
            Container(
              height: 85,
            ),
            Center(
              child: Text(
                'We can start something new',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class newname extends StatelessWidget {
  const newname({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
          obscureText: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            label: Center(child: Text("Name")),
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}

class newemail extends StatelessWidget {
  const newemail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
          obscureText: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            label: Center(child: Text("Email")),
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}

class birth extends StatefulWidget {
  @override
  State<birth> createState() => _birthState();
}

var selected_date = '1';
var selected_year = '2022';
var selected_month = '1';

class _birthState extends State<birth> {
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> dates =
        dropdownlist(starting: 1, ending: 32);
    List<DropdownMenuItem<String>> month =
        dropdownlist(starting: 1, ending: 12);
    List<DropdownMenuItem<String>> year =
        dropdownlist(starting: 1945, ending: 2098);

    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "BIRTH",
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
          DropdownButton<String>(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            dropdownColor: Colors.grey.shade500,
            style: TextStyle(color: Colors.white70),
            value: selected_date,
            items: dates,
            onChanged: (String? newvalue) {
              setState(() {
                selected_date = newvalue!;
              });
            },
          ),
          DropdownButton<String>(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            dropdownColor: Colors.grey.shade500,
            style: TextStyle(color: Colors.white70),
            value: selected_month,
            items: month,
            onChanged: (String? newvalue) {
              setState(() {
                selected_month = newvalue!;
              });
            },
          ),
          DropdownButton<String>(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            dropdownColor: Colors.grey.shade500,
            style: TextStyle(color: Colors.white70),
            value: selected_year,
            items: year,
            onChanged: (String? newvalue) {
              setState(() {
                selected_year = newvalue!;
                print("pressed");
              });
            },
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> dropdownlist(
      {required var starting, required var ending}) {
    List<DropdownMenuItem<String>> listt = [];
    for (var i = starting; i <= ending; i++) {
      var item = DropdownMenuItem(
        child: Text(i.toString()),
        value: i.toString(),
      );
      listt.add(item);
    }
    return listt;
  }
}

class prevuser extends StatelessWidget {
  const prevuser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 30),
      child: Container(
        alignment: Alignment.topRight,
        //color: Colors.red,
        height: 20,
        child: Row(
          children: [
            Text(
              "Have we meet before",
              style: TextStyle(fontSize: 12, color: Colors.white70),
            ),
            FlatButton(
                onPressed: () {},
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
