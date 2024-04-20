import 'package:arquitetura_flutter/app/models/app_config_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  static final HomeController instance = HomeController._();
  HomeController._();

  final AppConfigModel appConfigModel = AppConfigModel();
  bool get isDark => appConfigModel.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => appConfigModel.themeSwitch;

  changeValue(bool value) {
    appConfigModel.themeSwitch.value = value;
  }
}
