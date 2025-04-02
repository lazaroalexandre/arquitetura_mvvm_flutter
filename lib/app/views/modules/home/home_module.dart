import 'package:arquitetura_flutter/app/viewmodels/user_viewmodel.dart';
import 'package:arquitetura_flutter/app/views/modules/home/controllers/user_controller.dart';
import 'package:arquitetura_flutter/app/views/modules/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomeModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton(
          (i) => UserViewmodel(userRepository: i(), appMessageService: i()),
        ),
        Bind.lazySingleton(
          (i) => UserController(viewmodel: i()),
        ),
      ];
  @override
  String get moduleRouteName => '/';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/': (_) => HomePage(),
      };
}
