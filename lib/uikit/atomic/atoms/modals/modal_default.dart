import 'package:flutter/material.dart';

class ModalDefault extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final double padding;
  const ModalDefault({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(padding),
        child: child,
      ),
    );
  }
}
