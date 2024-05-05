import 'package:arquitetura_flutter/app/presentation/home/controllers/sex_controller.dart';
import 'package:arquitetura_flutter/app/uikit/atomic/molecules/molecule.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
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
                validator: Validatorless.required('Campo obrigatório'),
              ),
              FormInput(
                text: 'E-mail',
                controller: email,
                validator: Validatorless.multiple([
                  Validatorless.required('Campo obrigatório'),
                  Validatorless.email('O campo deve ter formato de e-mail'),
                ]),
              ),
              FormInput(
                text: 'Profissão',
                controller: job,
                validator: Validatorless.required('Campo obrigatório'),
              ),
              FormInput(
                text: 'Telefone',
                controller: phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  MaskTextInputFormatter(
                    mask: '(##) #####-####',
                    filter: {'#': RegExp(r'[0-9]')},
                  ),
                ],
                validator: Validatorless.multiple([
                  Validatorless.required('Campo obrigatório'),
                  Validatorless.min(
                      15, 'O campo deve ter no mínimo 11 dígitos'),
                  Validatorless.max(
                      15, 'O campo deve ter no máximo 11 dígitos'),
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
