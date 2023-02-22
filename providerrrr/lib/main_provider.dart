import 'package:flutter/material.dart';

class Counterr with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  void increase() {
    _counter++;
    notifyListeners();
  }
}
