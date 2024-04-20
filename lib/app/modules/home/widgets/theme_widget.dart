import 'package:arquitetura_flutter/app/modules/home/controllers/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

final controller = Modular.get<HomeStore>();

final class ThemeWidget {
  static ThemeData themeData = controller.theme();
}
