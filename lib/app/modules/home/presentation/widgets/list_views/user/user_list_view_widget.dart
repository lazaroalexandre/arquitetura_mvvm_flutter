import 'package:arquitetura_flutter/app/modules/home/models/user_model.dart';
import 'package:arquitetura_flutter/app/modules/home/presentation/controllers/user_controller.dart';
import 'package:arquitetura_flutter/app/modules/home/presentation/widgets/cards/card_list_tile_widget.dart';
import 'package:arquitetura_flutter/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class UserListUserViewWidget extends StatelessWidget {
  const UserListUserViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context, listen: false);
    userController.getAllUsers();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Scale.xs),
      child: Consumer<UserController>(
        builder: (_, controller, __) {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.error.value.isNotEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/internal-server.png",
                    height: Scale.xxl),
                HeadlineText(
                    text: AppLocalizations.of(context)!.error_internal_server),
              ],
            );
          }
          if (controller.users.value.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/empty-pana.png", height: Scale.xxl),
                HeadlineText(
                    text: AppLocalizations.of(context)!.without_contact),
              ],
            );
          }
          return ListView.builder(
            itemCount: controller.users.value.length,
            itemBuilder: (_, index) {
              final UserModel model = controller.users.value[index];
              return CardListTileWidget(model: model);
            },
          );
        },
      ),
    );
  }
}
