import 'package:flutter/cupertino.dart';

class HomeController {
  static final HomeController instance = HomeController._();
  HomeController._();

  final themeSwitch = ValueNotifier<bool>(false);
  changeValue(bool value) {
    themeSwitch.value = value;
  }
}
