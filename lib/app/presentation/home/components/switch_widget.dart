import 'package:arquitetura_flutter/app/get_it_inject.dart';
import 'package:arquitetura_flutter/app/presentation/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  SwitchWidget({super.key});

  final homeController = GetItInject.getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Switch(
          thumbIcon: homeController.isDark
              ? const MaterialStatePropertyAll(Icon(
                  Icons.bedtime_rounded,
                ))
              : const MaterialStatePropertyAll(Icon(
                  Icons.auto_awesome_rounded,
                )),
          value: homeController.isDark,
          onChanged: (value) {
            homeController.changeThemeViewmodel
                .changeValue(value);
          },
        ),
      ),
    );
  }
}
