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
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class AppBindings extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
        Bind.singleton<LocalStorageService>(
          (i) => LocalStoreServiceImpl(
            storage: FlutterSecureStorage(),
          ),
        ),
        Bind.singleton<ClientService>(
          (i) => ClientServiceImpl(
            dio: Dio(),
          ),
        ),
        Bind.singleton<AppMessageService>(
          (i) => AppMessageServiceImpl(
            navigatorKey: NavigatorGlobal.navigatorKey,
          ),
        ),
        Bind.singleton<UserRepository>(
          (i) => UserRepositoryImpl(
            clientService: i(),
          ),
        ),
        Bind.singleton<ThemeController>(
          (i) => ThemeController(
            localStorageService: i(),
          ),
        ),
      ];
}
