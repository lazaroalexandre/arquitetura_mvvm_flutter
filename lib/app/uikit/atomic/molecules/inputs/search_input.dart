// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/uikit/tokens/sizes/scale.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final void Function(String)? onChanged;
  const SearchInput({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 24),
        suffixIcon: Icon(
          Icons.search,
          size: Scale.sm,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Scale.xl),
          ),
        ),
        hintText: "Pesquisar..."
      ),
      onChanged: onChanged,
    );
  }
}
