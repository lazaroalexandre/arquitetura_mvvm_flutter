import 'package:arquitetura_flutter/app/get_it_inject.dart';
import 'package:arquitetura_flutter/app/presentation/home/controllers/user_controller.dart';
import 'package:arquitetura_flutter/app/uikit/uikit.dart';
import 'package:flutter/material.dart';

class SearchUserWidget extends StatelessWidget {
  SearchUserWidget({super.key});
  final userController = GetItInject.getIt<UserController>();

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
