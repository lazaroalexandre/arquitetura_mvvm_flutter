// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/uikit/atomic/molecules/texts/super_title_text.dart';
import 'package:flutter/material.dart';

class ModalDefault extends StatelessWidget {
  final String title;
  final Widget content;
  final List<Widget> actions;
  const ModalDefault({
    Key? key,
    required this.title,
    required this.content,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: SuperTitleText(
        text: title,
      ),
      content: content,
      actions: actions,
    );
  }
}
