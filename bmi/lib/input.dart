// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:cal/screen1.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuse.dart';
import 'result.dart';
import 'calculate.dart';
import 'screen1.dart';

const bottomcontainerheight = 50.0;
const maincolor = Color(0xFF1D1E33);
const secondarycolor = Color(0xFF11328);

enum Gender { male, female }

Gender? selectedgender;

class start extends StatefulWidget {
  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  int heightt = 100;
  int age = 20;
  int weight = 50;
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text("BMI Calculate")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    child: Reuse(
                      colour: selectedgender == Gender.male
                          ? maincolor
                          : secondarycolor,
                      ccard: firstcolumn(
                          firstcolumntext: 'MALE',
                          firstcolumnicon: FontAwesomeIcons.mars),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedgender = Gender.female;
                      });
                    },
                    child: Reuse(
                      colour: selectedgender == Gender.female
                          ? maincolor
                          : secondarycolor,
                      ccard: firstcolumn(
                          firstcolumntext: 'FEMALE',
                          firstcolumnicon: FontAwesomeIcons.venus),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reuse(
              colour: maincolor,
              ccard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Text(
                          heightt.toString(),
                          style: heightstyle,
                        ),
                        Text(
                          "cm",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.red,
                          thumbColor: Colors.blueGrey,
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15)),
                      child: Slider(
                        value: heightt.toDouble(),
                        min: 12.0,
                        max: 220.0,
                        inactiveColor: Colors.white,
                        onChanged: (double newvalue) {
                          setState(() {
                            heightt = newvalue.round();
                          });
                        },
                      ),
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: Reuse(
                  colour: maincolor,
                  ccard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(weight.toString(), style: heightstyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            roundbutton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                iconss: FontAwesomeIcons.minus,
                                coloor: Colors.white),
                            SizedBox(width: 10),
                            roundbutton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                iconss: FontAwesomeIcons.plus,
                                coloor: Colors.white),
                          ],
                        )
                      ]),
                )),
                Expanded(
                  child: Reuse(
                    colour: maincolor,
                    ccard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(age.toString(), style: heightstyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              roundbutton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  iconss: FontAwesomeIcons.minus,
                                  coloor: Colors.white),
                              SizedBox(width: 10),
                              roundbutton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  iconss: FontAwesomeIcons.plus,
                                  coloor: Colors.white),
                            ],
                          )
                        ]),
                  ),
                )
              ],
            ),
          ),
          buttomwidget(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: heightt, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => result(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            teext: 'CALCULATE',
          ),
        ],
      ),
    ));
  }
}

class buttomwidget extends StatelessWidget {
  buttomwidget({required this.onTap, required this.teext});
  final Function onTap;
  final String teext;
  @override
  Widget build(BuildContext context) {
    return (GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 210, 67, 57),
        ),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: bottomcontainerheight,
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            teext,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    ));
  }
}

class roundbutton extends StatelessWidget {
  roundbutton({this.iconss, this.coloor, required this.onPressed});
  final IconData? iconss;
  final Color? coloor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return (RawMaterialButton(
      child: Icon(
        iconss,
        color: coloor,
      ),
      shape: CircleBorder(),
      fillColor: Colors.grey,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: onPressed,
    ));
  }
}
