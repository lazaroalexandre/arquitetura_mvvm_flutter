import 'package:arquitetura_flutter/uikit/uikit.dart';
import 'package:flutter/material.dart';

class SuperModal extends StatelessWidget {
final Widget child;
  const SuperModal({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalDefault(
      height: Scale.xxxl,
      width: Scale.xxxl,
      padding: Scale.md,
      child: child,
    );
  }
}