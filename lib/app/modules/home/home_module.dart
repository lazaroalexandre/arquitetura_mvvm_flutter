import 'package:arquitetura_flutter/app/modules/home/controllers/home_store.dart';
import 'package:arquitetura_flutter/app/modules/home/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(HomeStore.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (_) => const HomePage());
  }
}
