import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final class FormValidatorMessage {
  static String required(BuildContext context) => AppLocalizations.of(context)!.required_validation;
  static String email(BuildContext context) => AppLocalizations.of(context)!.email_validation;
  static String phoneMin(BuildContext context) => AppLocalizations.of(context)!.phone_min_validation;
  static String phoneMax(BuildContext context) => AppLocalizations.of(context)!.phone_max_validation;
}
