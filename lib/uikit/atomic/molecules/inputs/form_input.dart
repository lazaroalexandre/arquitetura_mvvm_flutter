import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:arquitetura_flutter/uikit/uikit.dart';

class FormInput extends StatelessWidget {
  final String text;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  const FormInput({
    Key? key,
    required this.text,
    this.inputFormatters,
    this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        label: BodyText(text: text),
      ),
    );
  }
}
