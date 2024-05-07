import 'package:arquitetura_flutter/app/uikit/uikit.dart';
import 'package:flutter/material.dart';

class ButtonDefault extends StatelessWidget {
  final void Function()? onPressed;
  final bool isDark;
  final String text;
  const ButtonDefault({
    Key? key,
    this.onPressed,
    this.isDark = false,
    required this.text,
  }) : super(key: key);

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
