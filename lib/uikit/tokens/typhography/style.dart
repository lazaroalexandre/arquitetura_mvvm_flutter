import 'package:arquitetura_flutter/uikit/tokens/typhography/font.dart';
import 'package:flutter/material.dart';

final class Style {
  static const TextStyle headline = TextStyle(
    fontSize: Font.xl,
    fontWeight: Font.bold,
  );

  static const TextStyle superTitle = TextStyle(
    fontSize: Font.xl,
    fontWeight: Font.semiBold,
  );

  static const TextStyle title = TextStyle(
    fontSize: Font.lg,
    fontWeight: Font.bold,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: Font.lg,
    fontWeight: Font.medium,
  );

  static const TextStyle body = TextStyle(
    fontSize: Font.md,
    fontWeight: Font.medium,
  );
}
