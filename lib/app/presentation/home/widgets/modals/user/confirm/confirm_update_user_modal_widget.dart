import 'package:arquitetura_flutter/app/get_it_inject.dart';
import 'package:arquitetura_flutter/app/presentation/home/controllers/user_controller.dart';
import 'package:arquitetura_flutter/app/uikit/atomic/molecules/molecule.dart';
import 'package:flutter/material.dart';

import 'package:arquitetura_flutter/app/models/user_model.dart';

class ConfirmUpdateUserModalWidget extends StatelessWidget {
  final UserModel userModel;
  ConfirmUpdateUserModalWidget({
    Key? key,
    required this.userModel,
  }) : super(key: key);
  final controller = GetItInject.getIt<UserController>();

  @override
  Widget build(BuildContext context) {
    return SmallModal(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SuperTitleText(
                text: "Tem certeza que deseja salvar as alterações?",
              ),
              MediumSpace(),
              BodyText(
                  text:
                      "Ao confirmar, os dados alterados não poderão mais ser disfeitos!\nSe você não tiver certeza no que está prestes a fazer, clique em cancelar, por favor."),
            ],
          ),
          GroupModalButtons(
            back: "Cancelar",
            next: "Confirmar",
            onPressedBack: () => Navigator.of(context).pop(),
            onPressedNext: () {
              controller.putUser(userModel, userModel.id.toString());
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
