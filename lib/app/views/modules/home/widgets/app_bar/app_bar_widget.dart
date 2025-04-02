// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/views/modules/home/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:uikit/uikit.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  final themeController = Injector.get<ThemeController>();

  @override
  void initState() {
    super.initState();
    themeController.init();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: themeController.isDark,
        builder: (context, value, child) => AppBarCustom(
              text: AppLocalizations.of(context)!.my_contacts,
              isDark: value,
              onChanged: (_) => themeController.toggleTheme(),
            ));
  }
}
