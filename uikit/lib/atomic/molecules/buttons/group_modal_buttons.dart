import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class GroupModalButtons extends StatelessWidget {
  final String back;
  final String next;
  final void Function()? onPressedBack;
  final void Function()? onPressedNext;
  const GroupModalButtons({
    super.key,
    required this.back,
    required this.next,
    this.onPressedBack,
    this.onPressedNext,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isScreenNarrow = screenWidth < Scale.xxxl;

    if (isScreenNarrow) {
      return Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ButtonDefault(
              text: back,
              onPressed: onPressedBack,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ButtonDefault(
              text: next,
              onPressed: onPressedNext,
              isDark: true,
            ),
          ),
        ],
      );
    }

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
