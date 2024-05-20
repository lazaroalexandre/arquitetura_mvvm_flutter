import 'package:arquitetura_flutter/app/modules/home/home_route.dart';
import 'package:arquitetura_flutter/app/modules/home/repositories/user_repository.dart';
import 'package:arquitetura_flutter/app/modules/home/repositories/user_repository_impl.dart';
import 'package:arquitetura_flutter/app/core/services/client/client_service.dart';
import 'package:arquitetura_flutter/app/core/services/client/client_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomeModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserRepository>(
          (i) => UserRepositoryImpl(
            clientService: i(),
          ),
        ),
        Bind.lazySingleton<ClientService>(
          (i) => ClientServiceImpl(),
        ),
      ];

  @override
  String get moduleRouteName => '/';

  @override
  Map<String, WidgetBuilder> get pages => {'/': (context) => const HomeRoute()};
}
