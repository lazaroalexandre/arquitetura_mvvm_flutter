import 'package:arquitetura_flutter/app/utils/navigator/navigator_global.dart';
import 'package:arquitetura_flutter/app/views/bindings/app_bindings.dart';
import 'package:arquitetura_flutter/app/views/modules/home/controllers/theme_controller.dart';
import 'package:arquitetura_flutter/app/views/modules/home/home_module.dart';
import 'package:arquitetura_flutter/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uikit/uikit.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      bindings: AppBindings(),
      modules: [HomeModule()],
      builder: (context, routes, flutterGetItNavObserver) {
        final themeController = Injector.get<ThemeController>();
        themeController.init();
        return ValueListenableBuilder(
          valueListenable: themeController.isDark,
          builder: (context, value, child) => MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            navigatorKey: NavigatorGlobal.navigatorKey,
            theme: value ? darkTheme : ligthTheme,
            navigatorObservers: [flutterGetItNavObserver],
            supportedLocales: L10n.all,
            routes: routes,
          ),
        );
      },
    );
  }
}
