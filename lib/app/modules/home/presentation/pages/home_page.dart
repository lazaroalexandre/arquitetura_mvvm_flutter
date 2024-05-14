import 'package:arquitetura_flutter/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:arquitetura_flutter/app/modules/home/presentation/widgets/inputs/search_user_widget.dart';
import 'package:arquitetura_flutter/app/modules/home/presentation/widgets/list_views/user/user_list_view_widget.dart';
import 'package:arquitetura_flutter/app/modules/home/presentation/widgets/modals/user/create/modal_created.dart';
import 'package:arquitetura_flutter/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        actions: [
          SwitchDefault(
              thumbIcon: controller.isDark
                  ? const MaterialStatePropertyAll(
                      Icon(
                        Icons.bedtime_rounded,
                      ),
                    )
                  : const MaterialStatePropertyAll(
                      Icon(
                        Icons.circle,
                      ),
                    ),
              value: controller.isDark,
              onChanged: (value) {
                controller.changeThemeViewmodel.changeValue(value);
              },
              heigth: Scale.lg),
          const MediumSpace()
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: Scale.xs),
          child: Row(
            children: [
              const Icon(
                Icons.person,
                size: Scale.md,
                color: LightColors.onPrimary,
              ),
              const SizedBox(
                width: Scale.xxs,
              ),
              HeadlineText(
                text: AppLocalizations.of(context)!.my_contacts,
              ),
            ],
          ),
        ),
      ),
      body: const Column(
        children: [
          SearchUserWidget(),
          Expanded(child: UserListUserViewWidget()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const ModalCreated();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
