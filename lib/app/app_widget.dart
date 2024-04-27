import 'package:arquitetura_flutter/app/presentation/home/controllers/home_controller.dart';
import 'package:arquitetura_flutter/app/presentation/home/controllers/user_controller.dart';
import 'package:arquitetura_flutter/app/presentation/home/pages/home_page.dart';
import 'package:arquitetura_flutter/app/repositories/user_repository_impl.dart';
import 'package:arquitetura_flutter/app/services/client/client_service_impl.dart';
import 'package:arquitetura_flutter/app/viewmodels/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserController>.value(
          value: UserController(
            viewmodel: UserViewmodel(
              userRepository: UserRepositoryImpl(
                clientInterface: ClientServiceImpl(),
              ),
            ),
          ),
        ),
      ],
      child: ValueListenableBuilder<bool>(
        valueListenable: HomeController.instance.themeSwitch,
        builder: (_, isDark, __) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: isDark ? ThemeData.dark() : ThemeData.light(),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
