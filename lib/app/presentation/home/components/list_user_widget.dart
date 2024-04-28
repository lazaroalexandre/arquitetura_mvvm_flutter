import 'package:arquitetura_flutter/app/models/user_model.dart';
import 'package:arquitetura_flutter/app/presentation/home/components/list_tile_widget.dart';
import 'package:arquitetura_flutter/app/presentation/home/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListUserWidget extends StatelessWidget {
  const ListUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context, listen: false);
    userController.getUsers();
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
              return ListTileWidget(model: model);
            },
          );
        },
      ),
    );
  }
}
