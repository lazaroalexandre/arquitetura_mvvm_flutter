// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/presentation/home/controllers/sex_controller.dart';
import 'package:arquitetura_flutter/app/presentation/home/widgets/forms/user/form_user.dart';
import 'package:arquitetura_flutter/app/presentation/home/widgets/modals/user/confirm/confirm_update_user_modal_widget.dart';
import 'package:arquitetura_flutter/app/uikit/atomic/molecules/molecule.dart';
import 'package:flutter/material.dart';

import 'package:arquitetura_flutter/app/models/user_model.dart';

class ModalUpdate extends StatefulWidget {
  final UserModel model;

  const ModalUpdate({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<ModalUpdate> createState() => _ModalUpdateState();
}

class _ModalUpdateState extends State<ModalUpdate> {
  final _formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _jobEC = TextEditingController();
  final _phoneEC = TextEditingController();
  final _sexEC = SexController();

  @override
  void initState() {
    super.initState();
    _nameEC.text = widget.model.name;
    _emailEC.text = widget.model.email;
    _jobEC.text = widget.model.job;
    _phoneEC.text = widget.model.phone;
    _sexEC.selectSex.value = widget.model.sex;
  }

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
          const Text(
            "Detalhes do Contato",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              onChanged: (value) => _sexEC.setSex(
                value.toString(),
              ),
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
                  id: widget.model.id,
                  name: _nameEC.text,
                  sex: _sexEC.selectSex.value,
                  email: _emailEC.text,
                  job: _jobEC.text,
                  phone: _phoneEC.text,
                );
                showDialog(
                  context: context,
                  builder: (context) =>
                      ConfirmUpdateUserModalWidget(userModel: userModel),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
