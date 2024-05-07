import 'package:arquitetura_flutter/app/modules/home/models/user_model.dart';
import 'package:arquitetura_flutter/app/modules/home/presentation/controllers/user_controller.dart';
import 'package:arquitetura_flutter/app/modules/home/presentation/widgets/cards/card_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class UserListUserViewWidget extends StatelessWidget {
  UserListUserViewWidget({super.key});

  final userController = Injector.get<UserController>();

  @override
  Widget build(BuildContext context) {
    userController.getAllUsers();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AnimatedBuilder(
        animation: userController,
        builder: (_, __) {
          if (userController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (userController.error.value.isNotEmpty) {
            return Center(
              child: Text(userController.error.value),
            );
          }
          if (userController.users.value.isEmpty) {
            return const Center(
              child: Text("Não existem contatos registrados!"),
            );
          }
          return ListView.builder(
            itemCount: userController.users.value.length,
            itemBuilder: (_, index) {
              final UserModel model = userController.users.value[index];
              return CardListTileWidget(model: model);
            },
          );
        },
      ),
    );
  }
}
