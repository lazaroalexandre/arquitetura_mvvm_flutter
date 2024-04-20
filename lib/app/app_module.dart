import 'package:arquitetura_flutter/app/modules/home/controllers/home_store.dart';
import 'package:arquitetura_flutter/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(HomeStore.new);
  }

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: HomeModule());
  }
}
