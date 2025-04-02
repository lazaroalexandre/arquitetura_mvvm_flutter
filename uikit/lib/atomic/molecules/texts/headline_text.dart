import 'package:uikit/uikit.dart';
import 'package:flutter/material.dart';

class HeadlineText extends StatelessWidget {
  final String text;
  const HeadlineText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Style.headline,
    );
  }
}
