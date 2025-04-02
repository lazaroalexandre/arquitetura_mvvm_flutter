import 'package:arquitetura_flutter/app/views/providers/app_providers.dart';
import 'package:arquitetura_flutter/app/views/routers/app_routers.dart';
import 'package:arquitetura_flutter/app/views/modules/home/controllers/theme_controller.dart';
import 'package:arquitetura_flutter/app/views/modules/home/home_module.dart';
import 'package:arquitetura_flutter/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:uikit/uikit.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...AppProviders.providers(),
        ...HomeModule.providers(),
      ],
      child: Consumer<ThemeController>(
        builder: (context, value, child) {
          value.init();
          return MaterialApp.router(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: value.isDark.value ? darkTheme : ligthTheme,
            supportedLocales: L10n.all,
            routerConfig: AppRouters.router,
          );
        },
      ),
    );
  }
}
