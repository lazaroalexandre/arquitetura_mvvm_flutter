// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/atomic/molecules/molecule.dart';

class RadioLabel extends StatelessWidget {
  final String label;
  final String value;
  final String groupValue;
  final void Function(Object?)? onChanged;

  const RadioLabel({
    super.key,
    required this.label,
    required this.value,
    required this.groupValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        BodyText(
          text: label,
        ),
      ],
    );
  }
}
