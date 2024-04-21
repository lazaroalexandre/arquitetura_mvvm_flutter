import 'package:arquitetura_flutter/app/interfaces/local_storage_interface.dart';
import 'package:arquitetura_flutter/app/models/app_config_model.dart';
import 'package:arquitetura_flutter/app/services/shared_local_store_service.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  static final HomeController instance = HomeController._();
  HomeController._() {
    shared.get("isDark").then((value) {
      if (value != null) appConfigModel.themeSwitch.value = value;
    });
  }

  final LocalStorageInterface shared = SharedLocalStoreService();

  final AppConfigModel appConfigModel = AppConfigModel();
  bool get isDark => appConfigModel.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => appConfigModel.themeSwitch;

  changeValue(bool value) {
    appConfigModel.themeSwitch.value = value;
    shared.put("isDark", value);
  }
}
