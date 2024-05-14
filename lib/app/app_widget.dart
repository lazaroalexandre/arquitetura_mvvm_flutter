import 'package:arquitetura_flutter/app/core/services/local/local_store_service_impl.dart';
import 'package:arquitetura_flutter/app/core/viewmodel/change_theme_viewmodel.dart';
import 'package:arquitetura_flutter/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:arquitetura_flutter/app/modules/home/presentation/controllers/user_controller.dart';
import 'package:arquitetura_flutter/app/modules/home/presentation/pages/home_page.dart';
import 'package:arquitetura_flutter/app/modules/home/repositories/user_repository_impl.dart';
import 'package:arquitetura_flutter/app/modules/home/services/client/client_service_impl.dart';
import 'package:arquitetura_flutter/app/modules/home/viewmodels/user_viewmodel.dart';

import 'package:arquitetura_flutter/l10n/l10n.dart';
import 'package:arquitetura_flutter/uikit/visual_identity/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                clientService: ClientServiceImpl(),
              ),
            ),
          ),
        ),
        ChangeNotifierProvider<HomeController>.value(
          value: HomeController(
            changeThemeViewmodel: ChangeThemeViewmodel(
              shared: LocalStoreServiceImpl(),
            ),
          ),
        ),
      ],
      child: Consumer<HomeController>(
        builder: (_, controller, __) {
          controller.init();
          return MaterialApp(
            title: 'Contatos do Homolazarus',
            debugShowCheckedModeBanner: false,
            theme: controller.themeSwitch.value
                ? darkTheme
                : ligthTheme,
            home: const HomePage(),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: L10n.all,
          );
        },
      ),
    );
  }
}
