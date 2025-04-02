import 'package:arquitetura_flutter/app/models/user_model.dart';
import 'package:arquitetura_flutter/app/views/modules/home/controllers/user_controller.dart';
import 'package:arquitetura_flutter/app/views/modules/home/widgets/cards/card_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:uikit/uikit.dart';

class UserListUserViewWidget extends StatefulWidget {
  const UserListUserViewWidget({super.key});

  @override
  State<UserListUserViewWidget> createState() => _UserListUserViewWidgetState();
}

class _UserListUserViewWidgetState extends State<UserListUserViewWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserController>().getAllUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Scale.xs),
      child: Consumer<UserController>(
        builder: (context, value, child)  {
          if (value.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (value.users.value.isNotEmpty) {
            return ListView.builder(
              itemCount: value.users.value.length,
              itemBuilder: (_, index) {
                final UserModel model = value.users.value[index];
                return CardListTileWidget(userModel: model);
              },
            );
          }
          if (value.users.value.isEmpty) {
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
