import 'package:arquitetura_flutter/uikit/uikit.dart';
import 'package:flutter/material.dart';

class SmallSpace extends StatelessWidget {
  const SmallSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: Scale.xxs,
      height: Scale.xxs,
    );
  }
}
