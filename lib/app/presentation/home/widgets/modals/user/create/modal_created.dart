import 'package:arquitetura_flutter/app/get_it_inject.dart';
import 'package:arquitetura_flutter/app/models/user_model.dart';
import 'package:arquitetura_flutter/app/presentation/home/controllers/sex_controller.dart';
import 'package:arquitetura_flutter/app/presentation/home/controllers/user_controller.dart';
import 'package:arquitetura_flutter/app/presentation/home/widgets/forms/user/form_user.dart';
import 'package:arquitetura_flutter/app/uikit/atomic/molecules/molecule.dart';
import 'package:flutter/material.dart';

class ModalCreated extends StatefulWidget {
  const ModalCreated({Key? key}) : super(key: key);

  @override
  State<ModalCreated> createState() => _ModalCreatedState();
}

class _ModalCreatedState extends State<ModalCreated> {
  final _formKey = GlobalKey<FormState>();

  final controller = GetItInject.getIt<UserController>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _jobEC = TextEditingController();
  final _phoneEC = TextEditingController();
  final _sexEC = SexController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _phoneEC.dispose();
    _sexEC.dispose();
    _jobEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SuperModal(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SuperTitleText(
            text: "Novo Contato",
          ),
          const MediumSpace(),
          Expanded(
            child: FormUser(
              formKey: _formKey,
              name: _nameEC,
              email: _emailEC,
              job: _jobEC,
              phone: _phoneEC,
              sex: _sexEC,
              onChanged: (value) => _sexEC.setSex(value.toString()),
            ),
          ),
          GroupModalButtons(
            back: "Voltar",
            next: "Salvar",
            onPressedBack: () => Navigator.of(context).pop(),
            onPressedNext: () {
              final valid = _formKey.currentState?.validate() ?? false;
              if (valid) {
                final userModel = UserModel(
                  name: _nameEC.text,
                  sex: _sexEC.selectSex.value,
                  email: _emailEC.text,
                  job: _jobEC.text,
                  phone: _phoneEC.text,
                );
                controller.postUser(userModel);
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
    );
  }
}
