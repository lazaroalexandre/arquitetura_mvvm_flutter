import 'package:arquitetura_flutter/app/repositories/user_repository.dart';
import 'package:arquitetura_flutter/app/repositories/user_repository_impl.dart';
import 'package:arquitetura_flutter/app/services/client/client_service.dart';
import 'package:arquitetura_flutter/app/services/client/client_service_impl.dart';
import 'package:arquitetura_flutter/app/services/local/local_storage_service.dart';
import 'package:arquitetura_flutter/app/services/local/local_store_service_impl.dart';
import 'package:arquitetura_flutter/app/services/message/app_message_service.dart';
import 'package:arquitetura_flutter/app/services/message/app_message_service_impl.dart';
import 'package:arquitetura_flutter/app/utils/navigator/navigator_global.dart';
import 'package:arquitetura_flutter/app/views/modules/home/controllers/theme_controller.dart';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class AppProviders {
  static List providers() => [
        Provider<LocalStorageService>(
          create: (context) => LocalStoreServiceImpl(
            storage: FlutterSecureStorage(),
          ),
        ),
        Provider<ClientService>(
          create: (context) => ClientServiceImpl(
            dio: Dio(),
          ),
        ),
        Provider<AppMessageService>(
          create: (context) => AppMessageServiceImpl(
            navigatorKey: NavigatorGlobal.navigatorKey,
          ),
        ),
        Provider<UserRepository>(
          create: (context) => UserRepositoryImpl(
            clientService: context.read<ClientService>(),
          ),
        ),
        ChangeNotifierProvider<ThemeController>(
          create: (context) => ThemeController(
            localStorageService: context.read<LocalStorageService>(),
          ),
        ),
      ];
}
