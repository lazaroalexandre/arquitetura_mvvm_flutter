import 'package:arquitetura_flutter/app/services/local/local_store_service_impl.dart';
import 'package:arquitetura_flutter/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  static final HomeController instance = HomeController._();
  HomeController._() {
    changeThemeViewmodel.init();
  }

  final ChangeThemeViewmodel changeThemeViewmodel =
      ChangeThemeViewmodel(shared: LocalStoreServiceImpl());

  bool get isDark => changeThemeViewmodel.appConfigModel.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch =>
      changeThemeViewmodel.appConfigModel.themeSwitch;
}
