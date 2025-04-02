import 'package:arquitetura_flutter/app/models/user_model.dart';
import 'package:arquitetura_flutter/app/views/modules/home/controllers/user_controller.dart';
import 'package:arquitetura_flutter/app/views/modules/home/widgets/modals/modal_update_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:uikit/uikit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardListTileWidget extends StatelessWidget {
  final UserModel userModel;

  const CardListTileWidget({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UserController>(context);

    return ListTileCard(
      onPressedCard: () => showDialog(
        context: context,
        builder: (context) => ModalUpdateUserWidget(
          userModel: userModel,
        ),
      ),
      leading: userModel.avatar,
      title: userModel.name,
      subtitle:
          "${userModel.job} | ${userModel.sex} | ${userModel.email} | ${userModel.phone.replaceAllMapped(
        Mask.phoneOutput,
        Mask.photoOutputMacth,
      )}",
      onPressedTrailing: () => showDialog(
        context: context,
        builder: (context) => ModalConfirmCustom(
          title: AppLocalizations.of(context)!.title_confirm_delete,
          content: AppLocalizations.of(context)!.text_confirm_delete,
          name: userModel.name,
          id: userModel.id!,
          onPressedNext: () {
            controller.deleteUser(userModel.id.toString());
            Navigator.of(context).pop();
          },
          cancel: AppLocalizations.of(context)!.cancel,
          confirm: AppLocalizations.of(context)!.confirm,
        ),
      ),
      iconTrailing: const Icon(
        Icons.delete_outline_rounded,
      ),
    );
  }
}
