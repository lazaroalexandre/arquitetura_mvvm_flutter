import 'package:arquitetura_flutter/app/views/modules/home/controllers/user_controller.dart';
import 'package:arquitetura_flutter/app/views/modules/home/widgets/app_bar/app_bar_widget.dart';
import 'package:arquitetura_flutter/app/views/modules/home/widgets/list_views/user_list_view_widget.dart';
import 'package:arquitetura_flutter/app/views/modules/home/widgets/modals/modal_register_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uikit/atomic/molecules/inputs/search_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
        final controller = Provider.of<UserController>(context);

    return Scaffold(
        appBar: AppBarWidget(),
        body: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: controller.users,
              builder: (context, value, child) => SearchInput(
                hintText: AppLocalizations.of(context)!.search,
                onChanged: controller.filterUsers,
              ),
            ),
            Expanded(child: UserListUserViewWidget()),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return const ModalRegisterUserWidget();
              },
            );
          },
          child: const Icon(Icons.add),
        ));
  }
}
