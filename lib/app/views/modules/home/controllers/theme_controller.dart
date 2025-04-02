// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/utils/storage/app_storage.dart';
import 'package:flutter/material.dart';

import 'package:arquitetura_flutter/app/services/local/local_storage_service.dart';

class ThemeController extends ChangeNotifier {
  final LocalStorageService localStorageService;
  final isDark = ValueNotifier<bool>(false);

  ThemeController({required this.localStorageService});

  void init() async {
    final String? value = await localStorageService.get(AppStorage.theme);
    isDark.value = value != null ? value.toLowerCase() == 'true' : false;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    isDark.value = !isDark.value;
    await localStorageService.put(AppStorage.theme, isDark.value);
    notifyListeners();
  }
}
