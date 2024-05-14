import 'package:arquitetura_flutter/app/modules/home/viewmodels/user_viewmodel.dart';
import 'package:arquitetura_flutter/app/modules/home/presentation/controllers/user_controller.dart';
import 'package:arquitetura_flutter/app/modules/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomeRoute extends FlutterGetItModulePageRouter {
  const HomeRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton(
          (i) => UserController(
            viewmodel: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) => UserViewmodel(
            userRepository: i(),
          ),
        ),
      ];


  @override
  WidgetBuilder get view => (context) => const HomePage();

}
