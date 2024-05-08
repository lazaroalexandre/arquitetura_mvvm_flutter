import 'package:flutter/material.dart';
import 'package:arquitetura_flutter/uikit/uikit.dart';

class GroupModalButtons extends StatelessWidget {
  final String back;
  final String next;
  final void Function()? onPressedBack;
  final void Function()? onPressedNext;
  const GroupModalButtons({
    Key? key,
    required this.back,
    required this.next,
    this.onPressedBack,
    this.onPressedNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ButtonDefault(
          text: back,
          onPressed: onPressedBack,
        ),
        const MediumSpace(),
        ButtonDefault(
          text: next,
          onPressed: onPressedNext,
          isDark: true,
        ),
      ],
    );
  }
}
