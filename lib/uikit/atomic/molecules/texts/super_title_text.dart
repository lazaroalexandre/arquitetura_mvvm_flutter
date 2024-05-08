import 'package:arquitetura_flutter/uikit/uikit.dart';
import 'package:flutter/material.dart';

class SuperTitleText extends StatelessWidget {
  final String text;

  const SuperTitleText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Style.superTitle,
    );
  }
}
