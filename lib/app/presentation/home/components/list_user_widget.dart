import 'package:arquitetura_flutter/app/models/user_model.dart';
import 'package:arquitetura_flutter/app/presentation/home/components/list_tile_widget.dart';
import 'package:arquitetura_flutter/app/presentation/home/controllers/user_controller.dart';
import 'package:flutter/material.dart';

class ListUserWidget extends StatelessWidget {
  ListUserWidget({super.key});

  final UserController controller = UserController.instance;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.users,
      builder: (_, value, __) {
             if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (controller.error.value.isNotEmpty) {
                return Center(
                  child: Text(controller.error.value),
                );
              }
              if (controller.users.value.isEmpty) {
                return const Center(
                  child: Text("Não existem contatos registrados!"),
                );
              }
        return ListView.builder(
          itemCount: value.length,
          itemBuilder: (_, index) {
            final UserModel model = value[index];
            return ListTileWidget(model: model);
          },
        );
      },
    );
  }
}
