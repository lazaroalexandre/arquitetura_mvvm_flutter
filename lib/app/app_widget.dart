import 'package:arquitetura_flutter/app/get_it_inject.dart';
import 'package:arquitetura_flutter/app/presentation/home/controllers/home_controller.dart';
import 'package:arquitetura_flutter/app/presentation/home/pages/home_page.dart';
import 'package:arquitetura_flutter/app/uikit/visual_identity/themes/themes.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key});

  final homeController = GetItInject.getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
        homeController.init();
    return ValueListenableBuilder<bool>(
      valueListenable: homeController.themeSwitch,
      builder: (_, isDark, __) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: isDark ? darkTheme : ligthTheme,
          home: const HomePage(),
        );
      },
    );
  }
}
