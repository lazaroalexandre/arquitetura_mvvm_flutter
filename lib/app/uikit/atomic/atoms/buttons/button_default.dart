// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/uikit/atomic/molecules/texts/body_text.dart';
import 'package:arquitetura_flutter/app/uikit/tokens/colors/light_colors.dart';
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
