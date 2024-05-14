import 'package:arquitetura_flutter/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:arquitetura_flutter/app/core/services/local/local_store_service.dart';
import 'package:arquitetura_flutter/app/core/services/local/local_store_service_impl.dart';
import 'package:arquitetura_flutter/app/core/viewmodel/change_theme_viewmodel.dart';
import 'package:arquitetura_flutter/app/modules/home/home_module.dart';
import 'package:arquitetura_flutter/l10n/l10n.dart';
import 'package:arquitetura_flutter/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
        bindingsBuilder: () {
          return [
            Bind.singleton<LocalStoreService>(
              (i) => LocalStoreServiceImpl(),
            ),
            Bind.singleton(
              (i) => ChangeThemeViewmodel(
                shared: i(),
              ),
            ),
            Bind.singleton(
              (i) => HomeController(
                changeThemeViewmodel: i(),
              ),
            ),
          ];
        },
        modules: [
          HomeModule(),
        ],
        builder: (context, routes, flutterGetItNavObserver) {
          final homeController = Injector.get<HomeController>();
          homeController.init();
          return ValueListenableBuilder<bool>(
            valueListenable: homeController.themeSwitch,
            builder: (_, isDark, __) {
              return MaterialApp(
                title: 'Contatos do Homolazarus',
                debugShowCheckedModeBanner: false,
                theme: isDark ? darkTheme : ligthTheme,
                navigatorObservers: [flutterGetItNavObserver],
                routes: routes,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: L10n.all,
              );
            },
          );
        });
  }
}
