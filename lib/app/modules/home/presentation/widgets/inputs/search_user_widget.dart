import 'package:arquitetura_flutter/app/modules/home/presentation/controllers/user_controller.dart';
import 'package:arquitetura_flutter/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class SearchUserWidget extends StatelessWidget {
  SearchUserWidget({super.key});
  final userController = Injector.get<UserController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: SearchInput(
        onChanged: userController.filterUsers,
      ),
    );
  }
}
