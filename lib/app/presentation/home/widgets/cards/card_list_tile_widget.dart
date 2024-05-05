// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/presentation/home/widgets/modals/user/update/modal_update.dart';
import 'package:arquitetura_flutter/app/presentation/home/widgets/modals/user/confirm/confirm_delete_user_modal_widget.dart';
import 'package:arquitetura_flutter/app/uikit/atomic/atomic.dart';
import 'package:flutter/material.dart';

import 'package:arquitetura_flutter/app/models/user_model.dart';

class CardListTileWidget extends StatelessWidget {
  final UserModel model;

  const CardListTileWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileCard(
      onPressedCard: () => showDialog(
        context: context,
        builder: (context) => ModalUpdate(
          model: model,
        ),
      ),
      leading: model.avatar,
      title: model.name,
      subtitle: "${model.job} | ${model.sex} | ${model.email} | ${model.phone}",
      onPressedTrailing: () => showDialog(
        context: context,
        builder: (context) => ConfirmDeleteUserModalWidget(userModel: model),
      ),
      iconTrailing: const Icon(
        Icons.delete_outline_rounded,
      ),
    );
  }
}
