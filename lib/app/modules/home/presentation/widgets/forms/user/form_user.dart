import 'package:arquitetura_flutter/app/modules/home/presentation/controllers/sex_controller.dart';
import 'package:arquitetura_flutter/app/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class FormUser extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController job;
  final TextEditingController phone;
  final SexController sex;
  final void Function(Object?)? onChanged;
  const FormUser({
    Key? key,
    required this.formKey,
    required this.name,
    required this.email,
    required this.job,
    required this.phone,
    required this.sex,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormInput(
                text: 'Nome',
                controller: name,
                validator:
                    Validatorless.required(FormValidatorMessage.required),
              ),
              FormInput(
                text: 'E-mail',
                controller: email,
                validator: Validatorless.multiple([
                  Validatorless.required(FormValidatorMessage.required),
                  Validatorless.email(FormValidatorMessage.email),
                ]),
              ),
              FormInput(
                text: 'Profissão',
                controller: job,
                validator:
                    Validatorless.required(FormValidatorMessage.required),
              ),
              FormInput(
                text: 'Telefone',
                controller: phone,
                inputFormatters: Mask.phoneInput,
                validator: Validatorless.multiple([
                  Validatorless.required(FormValidatorMessage.required),
                  Validatorless.min(15, FormValidatorMessage.phoneMin),
                  Validatorless.max(15, FormValidatorMessage.phoneMax),
                ]),
              ),
              const MediumSpace(),
              const BodyText(
                text: 'Sexo:',
              ),
              const SmallSpace(),
              ValueListenableBuilder(
                valueListenable: sex.selectSex,
                builder: (_, sex, __) {
                  return Row(
                    children: [
                      Radio(
                        value: 'Masculino',
                        groupValue: sex,
                        onChanged: onChanged,
                      ),
                      const BodyText(text: 'Masculino'),
                      Radio(
                        value: 'Feminino',
                        groupValue: sex,
                        onChanged: onChanged,
                      ),
                      const BodyText(text: 'Feminino'),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
