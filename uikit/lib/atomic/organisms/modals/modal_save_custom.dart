// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/atomic/atoms/atom.dart';
import 'package:uikit/atomic/molecules/buttons/group_modal_buttons.dart';

class ModalSaveCustom extends StatelessWidget {
  final String title;
  final Widget content;
  final String cancel;
  final String confirm;
  final void Function()? onPressedNext;

  const ModalSaveCustom({
    super.key,
    required this.title,
    required this.content,
    required this.cancel,
    required this.confirm,
    this.onPressedNext,
  });

  @override
  Widget build(BuildContext context) {
    return ModalDefault(
      title: title,
      content: content,
      actions: [
        GroupModalButtons(
          back: cancel,
          next: confirm,
          onPressedBack: () => Navigator.of(context).pop(),
          onPressedNext: onPressedNext,
        ),
      ],
    );
  }
}
