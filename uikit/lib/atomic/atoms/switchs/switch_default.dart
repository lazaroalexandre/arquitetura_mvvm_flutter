import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class SwitchDefault extends StatelessWidget {
  final WidgetStatePropertyAll<Icon> thumbIcon;
  final bool value;
  final void Function(bool)? onChanged;
  final double heigth;

  const SwitchDefault({
    super.key,
    required this.thumbIcon,
    required this.value,
    this.onChanged,
    required this.heigth,
  });

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
