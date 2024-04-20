import 'package:arquitetura_flutter/app/presentation/home/controllers/home_controller.dart';
import 'package:arquitetura_flutter/app/presentation/home/pages/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: HomeController.instance.themeSwitch,
      builder: (context, isDart, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: isDart ? ThemeData.dark(): ThemeData.light(),
          home: const HomePage(),
        );
      }
    );
  }
}