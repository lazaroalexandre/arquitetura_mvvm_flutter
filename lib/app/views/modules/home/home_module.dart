import 'package:arquitetura_flutter/app/repositories/user_repository.dart';
import 'package:arquitetura_flutter/app/services/message/app_message_service.dart';
import 'package:arquitetura_flutter/app/viewmodels/user_viewmodel.dart';
import 'package:arquitetura_flutter/app/views/modules/home/controllers/user_controller.dart';
import 'package:arquitetura_flutter/app/views/modules/home/pages/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeModule {
  static List providers() => [
        Provider(
          create: (context) => UserViewmodel(
            userRepository: context.read<UserRepository>(),
            appMessageService: context.read<AppMessageService>(),
          ),
        ),
        ChangeNotifierProvider<UserController>(
          create: (context) => UserController(
            viewmodel: context.read<UserViewmodel>(),
          ),
        ),
      ];

  static final GoRoute router = GoRoute(
    path: '/',
    builder: (context, state) => HomePage(),
  );
}
