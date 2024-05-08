import 'package:arquitetura_flutter/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:arquitetura_flutter/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class AppBarSwitchWidget extends AppBar {
  final String text;
  AppBarSwitchWidget({
    super.key,
    required this.text,
  });

  final controller = Injector.get<HomeController>();

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
