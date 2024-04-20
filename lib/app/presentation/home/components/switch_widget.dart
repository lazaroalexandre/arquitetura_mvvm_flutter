import 'package:arquitetura_flutter/app/presentation/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: HomeController.instance.themeSwitch,
      builder: (context, value, snapshot) {
        return Switch(
          value: HomeController.instance.isDark,
          onChanged: (value) {
            HomeController.instance.changeValue(value);
          },
        );
      }
    );
  }
}
