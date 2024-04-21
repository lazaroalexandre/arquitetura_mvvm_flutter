import 'package:arquitetura_flutter/app/services/shared_local_store_service.dart';
import 'package:arquitetura_flutter/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  static final HomeController instance = HomeController._();
  HomeController._() {
    changeThemeViewmodel.init();
  }

  final ChangeThemeViewmodel changeThemeViewmodel =
      ChangeThemeViewmodel(shared: SharedLocalStoreService());

  bool get isDark => changeThemeViewmodel.appConfigModel.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch =>
      changeThemeViewmodel.appConfigModel.themeSwitch;
}
