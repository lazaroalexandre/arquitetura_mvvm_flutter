// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:arquitetura_flutter/app/uikit/uikit.dart';

class SmallModal extends StatelessWidget {
  final Widget child;
  const SmallModal({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalDefault(
      height: Scale.xxl,
      width: Scale.xxl,
      padding: Scale.md,
      child: child,
    );
  }
}
