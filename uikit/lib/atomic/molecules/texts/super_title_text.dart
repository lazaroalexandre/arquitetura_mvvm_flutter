import 'package:uikit/uikit.dart';
import 'package:flutter/material.dart';

class SuperTitleText extends StatelessWidget {
  final String text;

  const SuperTitleText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Style.superTitle,
    );
  }
}
