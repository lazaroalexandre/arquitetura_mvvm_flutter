import 'package:flutter/material.dart';
import 'package:arquitetura_flutter/uikit/uikit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchInput extends StatelessWidget {
  final void Function(String)? onChanged;
  const SearchInput({
    Key? key,
    this.onChanged,
  }) : super(key: key);

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
        hintText:  AppLocalizations.of(context)!.search
      ),
      onChanged: onChanged,
    );
  }
}
