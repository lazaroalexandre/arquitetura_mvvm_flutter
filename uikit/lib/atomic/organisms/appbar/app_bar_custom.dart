// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:uikit/atomic/molecules/molecule.dart';
import 'package:uikit/tokens/token.dart';

import '../../atoms/atom.dart';

class AppBarCustom extends AppBar {
  final String text;
  final bool isDark;
  final void Function(bool)? onChanged;
  AppBarCustom({
    super.key,
    required this.text,
    required this.isDark,
    this.onChanged,
  });

  @override
  Color? get surfaceTintColor => Colors.transparent;

  @override
  List<Widget>? get actions => [
        SwitchDefault(
            thumbIcon: isDark
                ? const WidgetStatePropertyAll(
                    Icon(
                      Icons.bedtime_rounded,
                    ),
                  )
                : const WidgetStatePropertyAll(
                    Icon(
                      Icons.circle,
                    ),
                  ),
            value: isDark,
            onChanged: onChanged,
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
