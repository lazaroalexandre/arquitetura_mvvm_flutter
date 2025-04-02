// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/views/modules/home/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:uikit/uikit.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ThemeController>(context);
    controller.init();

    return Consumer<ThemeController>(
        builder: (context, value, child) => AppBarCustom(
              text: AppLocalizations.of(context)!.my_contacts,
              isDark: value.isDark.value,
              onChanged: (_) => value.toggleTheme(),
            ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
