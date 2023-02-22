import 'package:flutter/material.dart';

class CustomPageNavigator extends PageRouteBuilder {
  final Widget Child;

  CustomPageNavigator({required this.Child})
      : super(
            transitionDuration: Duration(milliseconds: 400),
            pageBuilder: (context, animation, SecondaryAnimation) => Child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(
      scale: animation,
      child: Child,
    ); // TODO: implement buildTransitions
    //return super.buildTransitions(context, animation, secondaryAnimation, child);
  }
}
