// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class SearchInput extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChanged;
  const SearchInput({
    super.key,
    required this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        suffixIcon: const Icon(
          Icons.search,
          size: Scale.sm,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Scale.xl),
          ),
        ),
        hintText: hintText,
      ),
      onChanged: onChanged,
    );
  }
}
