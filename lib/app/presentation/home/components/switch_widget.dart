import 'package:arquitetura_flutter/app/presentation/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: HomeController.instance.themeSwitch,
        builder: (context, value, snapshot) {
          return SizedBox(
            height: 28,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Switch(
                thumbIcon: HomeController.instance.isDark
                    ? const MaterialStatePropertyAll(Icon(
                        Icons.bedtime_rounded,
                      ))
                    : const MaterialStatePropertyAll(Icon(
                        Icons.auto_awesome_rounded,
                      )),
                value: HomeController.instance.isDark,
                onChanged: (value) {
                  HomeController.instance.changeThemeViewmodel
                      .changeValue(value);
                },
              ),
            ),
          );
        });
  }
}
