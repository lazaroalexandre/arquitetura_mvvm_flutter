import 'package:arquitetura_flutter/uikit/uikit.dart';
import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  final String text;

  const SubtitleText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Style.subtitle,
    );
  }
}
