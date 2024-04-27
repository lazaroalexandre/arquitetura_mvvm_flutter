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
      child: Consumer<UserController>(
        builder: (_, value, __) {
          if (value.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (value.error.value.isNotEmpty) {
            return Center(
              child: Text(value.error.value),
            );
          }
          if (value.users.value.isEmpty) {
            return const Center(
              child: Text("Não existem contatos registrados!"),
            );
          }
          return ListView.builder(
            itemCount: value.users.value.length,
            itemBuilder: (_, index) {
              final UserModel model = value.users.value[index];
              return ListTileWidget(model: model);
            },
          );
        },
      ),
    );
  }
}
