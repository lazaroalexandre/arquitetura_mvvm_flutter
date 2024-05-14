import 'package:arquitetura_flutter/uikit/uikit.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;

  const TitleText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Style.title,
    );
  }
}
