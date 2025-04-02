// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/views/modules/home/controllers/sex_controller.dart';
import 'package:arquitetura_flutter/app/views/modules/home/controllers/user_controller.dart';
import 'package:arquitetura_flutter/app/views/modules/home/widgets/forms/form_user_widget.dart';
import 'package:flutter/material.dart';

import 'package:arquitetura_flutter/app/models/user_model.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uikit/uikit.dart';

class ModalRegisterUserWidget extends StatefulWidget {
  const ModalRegisterUserWidget({
    super.key,
  });

  @override
  State<ModalRegisterUserWidget> createState() =>
      _ModalRegisterUserWidgetState();
}

class _ModalRegisterUserWidgetState extends State<ModalRegisterUserWidget> {
  final _formKey = GlobalKey<FormState>();

  final controller = Injector.get<UserController>();
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
    return ModalSaveCustom(
      title: AppLocalizations.of(context)!.new_contact,
      content: FormUserWidget(
        formKey: _formKey,
        name: _nameEC,
        email: _emailEC,
        job: _jobEC,
        phone: _phoneEC,
        sex: _sexEC,
        onChanged: (value) => _sexEC.setSex(value.toString()),
      ),
      cancel: AppLocalizations.of(context)!.back,
      confirm: AppLocalizations.of(context)!.save,
      onPressedNext: () {
        final valid = _formKey.currentState?.validate() ?? false;
        if (valid) {
          final userModel = UserModel(
            name: _nameEC.text,
            sex: _sexEC.selectSex.value,
            email: _emailEC.text,
            job: _jobEC.text,
            phone: _phoneEC.text.replaceAll(Mask.removeMask, ''),
          );
          controller.postUser(userModel);
          Navigator.of(context).pop();
        }
      },
    );
  }
}
