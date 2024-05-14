import 'package:flutter/cupertino.dart';
import 'package:arquitetura_flutter/app/core/viewmodel/change_theme_viewmodel.dart';

class HomeController extends ChangeNotifier {
  final ChangeThemeViewmodel changeThemeViewmodel;
  HomeController({
    required this.changeThemeViewmodel,
  });

  bool get isDark => changeThemeViewmodel.appConfigModel.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch =>
      changeThemeViewmodel.appConfigModel.themeSwitch;

  init() async {
    await changeThemeViewmodel.init();
    notifyListeners();
  }
}
