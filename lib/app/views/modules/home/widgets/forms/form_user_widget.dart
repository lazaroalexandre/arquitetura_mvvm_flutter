import 'package:arquitetura_flutter/app/utils/messages/error_message.dart';
import 'package:arquitetura_flutter/app/views/modules/home/controllers/sex_controller.dart';
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';
import 'package:validatorless/validatorless.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FormUserWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController job;
  final TextEditingController phone;
  final SexController sex;
  final void Function(Object?)? onChanged;
  const FormUserWidget({
    super.key,
    required this.formKey,
    required this.name,
    required this.email,
    required this.job,
    required this.phone,
    required this.sex,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(right: Scale.xs),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormInput(
                text: AppLocalizations.of(context)!.name,
                controller: name,
                validator: Validatorless.required(
                  ErrorMessage.required(context),
                ),
              ),
              FormInput(
                text: AppLocalizations.of(context)!.email,
                controller: email,
                validator: Validatorless.multiple([
                  Validatorless.required(
                      ErrorMessage.required(context)),
                  Validatorless.email(ErrorMessage.email(context)),
                ]),
              ),
              FormInput(
                text: AppLocalizations.of(context)!.job,
                controller: job,
                validator: Validatorless.required(
                    ErrorMessage.required(context)),
              ),
              FormInput(
                text: AppLocalizations.of(context)!.phone,
                controller: phone,
                inputFormatters: Mask.phoneInput,
                validator: Validatorless.multiple([
                  Validatorless.required(
                      ErrorMessage.required(context)),
                  Validatorless.min(15, ErrorMessage.phoneMin(context)),
                  Validatorless.max(15, ErrorMessage.phoneMax(context)),
                ]),
              ),
              const MediumSpace(),
              BodyText(
                text: '${AppLocalizations.of(context)!.sex}:',
              ),
              const SmallSpace(),
              ValueListenableBuilder(
                  valueListenable: sex.selectSex,
                  builder: (_, sex, __) {
                    final double screenWidth =
                        MediaQuery.of(context).size.width;
                    final bool isScreenNarrow = screenWidth < Scale.xxxl;

                    if (isScreenNarrow) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: 'Masculino',
                                groupValue: sex,
                                onChanged: onChanged,
                              ),
                              BodyText(
                                  text: AppLocalizations.of(context)!.male),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 'Feminino',
                                groupValue: sex,
                                onChanged: onChanged,
                              ),
                              BodyText(
                                  text: AppLocalizations.of(context)!.female),
                            ],
                          ),
                        ],
                      );
                    }
                    return Row(
                      children: [
                        Radio(
                          value: 'Masculino',
                          groupValue: sex,
                          onChanged: onChanged,
                        ),
                        BodyText(text: AppLocalizations.of(context)!.male),
                        Radio(
                          value: 'Feminino',
                          groupValue: sex,
                          onChanged: onChanged,
                        ),
                        BodyText(text: AppLocalizations.of(context)!.female),
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
