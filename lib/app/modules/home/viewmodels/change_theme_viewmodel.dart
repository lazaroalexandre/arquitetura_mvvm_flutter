// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/core/models/app_config_model.dart';
import 'package:arquitetura_flutter/app/core/services/local/local_store_service.dart';

class ChangeThemeViewmodel {
  final LocalStoreService shared;
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
