import 'package:arquitetura_flutter/app/modules/home/presentation/controllers/user_controller.dart';
import 'package:flutter/material.dart';

import 'package:arquitetura_flutter/app/modules/home/models/user_model.dart';
import 'package:arquitetura_flutter/uikit/uikit.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfirmDeleteUserModalWidget extends StatelessWidget {
  final UserModel userModel;
  ConfirmDeleteUserModalWidget({
    Key? key,
    required this.userModel,
  }) : super(key: key);
  final controller = Injector.get<UserController>();

  @override
  Widget build(BuildContext context) {
    return SmallModal(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SuperTitleText(
                text:
                    "${AppLocalizations.of(context)!.title_confirm_delete} ${userModel.name}?",
              ),
              const MediumSpace(),
              BodyText(
                text: AppLocalizations.of(context)!.text_confirm_delete,
              ),
            ],
          ),
          GroupModalButtons(
            back: AppLocalizations.of(context)!.cancel,
            next: AppLocalizations.of(context)!.confirm,
            onPressedBack: () => Navigator.of(context).pop(),
            onPressedNext: () {
              controller.deleteUser(userModel.id.toString());
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
