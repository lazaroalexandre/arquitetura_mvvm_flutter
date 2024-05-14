import 'package:arquitetura_flutter/app/modules/home/presentation/controllers/user_controller.dart';
import 'package:arquitetura_flutter/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchUserWidget extends StatelessWidget {
  const SearchUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
  final userController = Provider.of<UserController>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Scale.md, vertical: Scale.xs),
      child: SearchInput(
        onChanged: userController.filterUsers,
      ),
    );
  }
}
