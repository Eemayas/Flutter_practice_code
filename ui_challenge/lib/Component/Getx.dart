import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var TextColors = Colors.black.obs;
  increment(Color Colors) {
    TextColors = Colors as Rx<Color>;
  }
}
