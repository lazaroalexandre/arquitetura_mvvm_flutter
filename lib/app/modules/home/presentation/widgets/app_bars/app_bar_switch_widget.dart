/* // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:arquitetura_flutter/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:arquitetura_flutter/uikit/uikit.dart';

class AppBarSwitchWidget extends AppBar {
  final BuildContext context;
  final String text;
  AppBarSwitchWidget({super.key, 
    required this.context,
    required this.text,
  });

  final controller = Provider.of<HomeController>(context);

  @override
  Color? get surfaceTintColor => Colors.transparent;

  @override
  List<Widget>? get actions => [
        SwitchDefault(
            thumbIcon: controller.isDark
                ? const MaterialStatePropertyAll(
                    Icon(
                      Icons.bedtime_rounded,
                    ),
                  )
                : const MaterialStatePropertyAll(
                    Icon(
                      Icons.circle,
                    ),
                  ),
            value: controller.isDark,
            onChanged: (value) {
              controller.changeThemeViewmodel.changeValue(value);
            },
            heigth: Scale.lg),
        const MediumSpace()
      ];

  @override
  Widget? get title => Padding(
        padding: const EdgeInsets.only(left: Scale.xs),
        child: Row(
          children: [
            const Icon(
              Icons.person,
              size: Scale.md,
              color: LightColors.onPrimary,
            ),
            const SizedBox(
              width: Scale.xxs,
            ),
            HeadlineText(
              text: text,
            ),
          ],
        ),
      );
}
 */