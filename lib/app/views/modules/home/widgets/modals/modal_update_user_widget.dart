// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/views/modules/home/controllers/sex_controller.dart';
import 'package:arquitetura_flutter/app/views/modules/home/controllers/user_controller.dart';
import 'package:arquitetura_flutter/app/views/modules/home/widgets/forms/form_user_widget.dart';
import 'package:flutter/material.dart';

import 'package:arquitetura_flutter/app/models/user_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:uikit/uikit.dart';

class ModalUpdateUserWidget extends StatefulWidget {
  final UserModel userModel;
  const ModalUpdateUserWidget({
    super.key,
    required this.userModel,
  });

  @override
  State<ModalUpdateUserWidget> createState() => _ModalUpdateUserWidgetState();
}

class _ModalUpdateUserWidgetState extends State<ModalUpdateUserWidget> {
  final _formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _jobEC = TextEditingController();
  final _phoneEC = TextEditingController();
  final _sexEC = SexController();

  @override
  void initState() {
    super.initState();
    _nameEC.text = widget.userModel.name;
    _emailEC.text = widget.userModel.email;
    _jobEC.text = widget.userModel.job;
    _phoneEC.text = widget.userModel.phone.replaceAllMapped(
      Mask.phoneOutput,
      Mask.photoOutputMacth,
    );
    _sexEC.selectSex.value = widget.userModel.sex;
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
    final controller = Provider.of<UserController>(context);
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
            id: widget.userModel.id,
            name: _nameEC.text,
            sex: _sexEC.selectSex.value,
            email: _emailEC.text,
            job: _jobEC.text,
            phone: _phoneEC.text.replaceAll(Mask.removeMask, ''),
          );
          showDialog(
            context: context,
            builder: (context) => ModalConfirmCustom(
              title: AppLocalizations.of(context)!.title_confirm_update,
              content: AppLocalizations.of(context)!.text_confirm_update,
              name: userModel.name,
              id: userModel.id!,
              onPressedNext: () {
                controller.putUser(userModel, userModel.id.toString());
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              cancel: AppLocalizations.of(context)!.cancel,
              confirm: AppLocalizations.of(context)!.confirm,
            ),
          );
        }
      },
    );
  }
}
