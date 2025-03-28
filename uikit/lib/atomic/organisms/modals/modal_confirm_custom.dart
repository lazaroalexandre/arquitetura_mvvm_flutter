// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/atomic/atoms/atom.dart';
import 'package:uikit/atomic/molecules/molecule.dart';

class ModalConfirmCustom extends StatelessWidget {
  final String id;
  final String name;
  final String title;
  final String content;
  final String cancel;
  final String confirm;
  final void Function()? onPressedNext;
  const ModalConfirmCustom({
    super.key,
    required this.id,
    required this.name,
    required this.title,
    required this.content,
    required this.cancel,
    required this.confirm,
    this.onPressedNext,
  });

  @override
  Widget build(BuildContext context) {
    return ModalDefault(
      title: "$title $name?",
      content: BodyText(
        text: content,
      ),
      actions: [
        GroupModalButtons(
          back: cancel,
          next: confirm,
          onPressedBack: () => Navigator.of(context).pop(),
          onPressedNext: onPressedNext
        ),
      ],
    );
  }
}
