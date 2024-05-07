import 'package:arquitetura_flutter/app/modules/home/presentation/widgets/app_bars/app_bar_switch_widget.dart';
import 'package:arquitetura_flutter/app/modules/home/presentation/widgets/inputs/search_user_widget.dart';
import 'package:arquitetura_flutter/app/modules/home/presentation/widgets/list_views/user/user_list_view_widget.dart';
import 'package:arquitetura_flutter/app/modules/home/presentation/widgets/modals/user/create/modal_created.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSwitchWidget(text: "Meus Contatos"),
      body: Column(
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
