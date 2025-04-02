// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:uikit/uikit.dart';

class BodyText extends StatelessWidget {
  final String text;
  final bool isDark;
  const BodyText({
    super.key,
    required this.text,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isDark
          ? Style.body.copyWith(
              color: DarkColors.onSurface,
            )
          : Style.body,
    );
  }
}
