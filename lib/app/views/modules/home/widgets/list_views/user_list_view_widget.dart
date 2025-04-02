import 'package:arquitetura_flutter/app/models/user_model.dart';
import 'package:arquitetura_flutter/app/views/modules/home/controllers/user_controller.dart';
import 'package:arquitetura_flutter/app/views/modules/home/widgets/cards/card_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uikit/uikit.dart';

class UserListUserViewWidget extends StatefulWidget {
  const UserListUserViewWidget({super.key});

  @override
  State<UserListUserViewWidget> createState() => _UserListUserViewWidgetState();
}

class _UserListUserViewWidgetState extends State<UserListUserViewWidget> {
  final userController = Injector.get<UserController>();

  @override
  void initState() {
    super.initState();
    userController.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Scale.xs),
      child: AnimatedBuilder(
        animation: userController,
        builder: (_, __) {
          if (userController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (userController.users.value.isNotEmpty) {
            return ListView.builder(
              itemCount: userController.users.value.length,
              itemBuilder: (_, index) {
                final UserModel model = userController.users.value[index];
                return CardListTileWidget(userModel: model);
              },
            );
          }
          if (userController.users.value.isEmpty) {
            return BannerCustom(
                title: AppLocalizations.of(context)!.without_contact,
                image: "assets/images/empty-pana.png");
          }
          return BannerCustom(
              title: AppLocalizations.of(context)!.error_internal_server,
              image: "assets/images/internal-server.png");
        },
      ),
    );
  }
}
