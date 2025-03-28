// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/atomic/molecules/molecule.dart';
import 'package:uikit/tokens/token.dart';

class BannerCustom extends StatelessWidget {
  final String title;
  final String image;
  const BannerCustom({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: Scale.xxl),
        HeadlineText(
          text: title,
        ),
      ],
    );
  }
}
