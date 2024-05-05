// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/uikit/tokens/colors/dark_colors.dart';
import 'package:arquitetura_flutter/app/uikit/tokens/colors/light_colors.dart';
import 'package:flutter/material.dart';

class SwitchDefault extends StatelessWidget {
  final MaterialStatePropertyAll<Icon> thumbIcon;
  final bool value;
  final void Function(bool)? onChanged;
  final double heigth;

  const SwitchDefault({
    Key? key,
    required this.thumbIcon,
    required this.value,
    this.onChanged,
    required this.heigth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heigth,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Switch(
          inactiveThumbColor: LightColors.primary,
          inactiveTrackColor: DarkColors.primary,
          thumbIcon: thumbIcon,
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
