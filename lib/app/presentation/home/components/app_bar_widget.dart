// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:arquitetura_flutter/app/presentation/home/components/switch_widget.dart';

class AppBarWidget extends AppBar {
  final String text;
  AppBarWidget({
    super.key,
    required this.text,
  });

  @override
  Color? get surfaceTintColor => Colors.transparent;

  @override
  ShapeBorder? get shape => const Border(bottom: BorderSide(width: 0.1));

  @override
  List<Widget>? get actions => const[ SwitchWidget(), SizedBox(width: 16)];

  @override
  Widget? get title => Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          children: [
            const Icon(
              Icons.person,
              size: 24,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
