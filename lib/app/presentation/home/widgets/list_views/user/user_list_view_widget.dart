import 'package:arquitetura_flutter/app/get_it_inject.dart';
import 'package:arquitetura_flutter/app/models/user_model.dart';
import 'package:arquitetura_flutter/app/presentation/home/widgets/cards/card_list_tile_widget.dart';
import 'package:arquitetura_flutter/app/presentation/home/controllers/user_controller.dart';
import 'package:flutter/material.dart';

class UserListUserViewWidget extends StatefulWidget {
  const UserListUserViewWidget({super.key});

  @override
  State<UserListUserViewWidget> createState() => _UserListUserViewWidget();
}

class _UserListUserViewWidget extends State<UserListUserViewWidget> {
  final userController = GetItInject.getIt<UserController>();

  @override
  void initState() {
    super.initState();
    userController.getAllUsers();
  }

  @override
  void dispose() {
    userController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
