// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/interfaces/local_storage_interface.dart';
import 'package:arquitetura_flutter/app/models/app_config_model.dart';

class ChangeThemeViewmodel {
  final LocalStorageInterface shared;
  ChangeThemeViewmodel({
    required this.shared,
  });

  final AppConfigModel appConfigModel = AppConfigModel();
  
  Future init() async {
    await shared.get("isDark").then((value) {
      if (value != null) appConfigModel.themeSwitch.value = value;
    });
  }

  changeValue(bool value) {
    appConfigModel.themeSwitch.value = value;
    shared.put("isDark", value);
  }
}
