import 'package:arquitetura_flutter/app/utils/navigator/navigator_global.dart';
import 'package:arquitetura_flutter/app/views/modules/home/home_module.dart';
import 'package:go_router/go_router.dart';

class AppRouters {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[HomeModule.router],
    navigatorKey: NavigatorGlobal.navigatorKey,
  );
}
