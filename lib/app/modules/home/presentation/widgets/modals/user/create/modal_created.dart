import 'package:arquitetura_flutter/app/modules/home/models/user_model.dart';
import 'package:arquitetura_flutter/app/modules/home/presentation/controllers/sex_controller.dart';
import 'package:arquitetura_flutter/app/modules/home/presentation/controllers/user_controller.dart';
import 'package:arquitetura_flutter/app/modules/home/presentation/widgets/forms/user/form_user.dart';
import 'package:arquitetura_flutter/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ModalCreated extends StatefulWidget {
  const ModalCreated({Key? key}) : super(key: key);

  @override
  State<ModalCreated> createState() => _ModalCreatedState();
}

class _ModalCreatedState extends State<ModalCreated> {
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
    return ModalDefault(
      title: AppLocalizations.of(context)!.new_contact,
      content: 
          FormUser(
            formKey: _formKey,
            name: _nameEC,
            email: _emailEC,
            job: _jobEC,
            phone: _phoneEC,
            sex: _sexEC,
            onChanged: (value) => _sexEC.setSex(value.toString()),
          ),
          actions: [
 GroupModalButtons(
            back: AppLocalizations.of(context)!.back,
            next: AppLocalizations.of(context)!.save,
            onPressedBack: () => Navigator.of(context).pop(),
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
          )
          ],
         

    );
  }
}
