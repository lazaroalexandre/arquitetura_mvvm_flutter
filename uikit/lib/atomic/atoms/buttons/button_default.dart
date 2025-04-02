import 'package:uikit/uikit.dart';
import 'package:flutter/material.dart';

class ButtonDefault extends StatelessWidget {
  final void Function()? onPressed;
  final bool isDark;
  final String text;
  const ButtonDefault({
    super.key,
    this.onPressed,
    this.isDark = false,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: isDark
          ? ElevatedButton.styleFrom(
              backgroundColor: LightColors.primary,
            )
          : null,
      child: BodyText(
        text: text,
        isDark: isDark? true: false,
      ),
    );
  }
}
