import 'package:arquitetura_flutter/app/presentation/home/controllers/home_controller.dart';
import 'package:arquitetura_flutter/app/presentation/home/controllers/user_controller.dart';
import 'package:arquitetura_flutter/app/repositories/user_repository.dart';
import 'package:arquitetura_flutter/app/repositories/user_repository_impl.dart';
import 'package:arquitetura_flutter/app/services/client/client_service.dart';
import 'package:arquitetura_flutter/app/services/client/client_service_impl.dart';
import 'package:arquitetura_flutter/app/services/local/local_store_service.dart';
import 'package:arquitetura_flutter/app/services/local/local_store_service_impl.dart';
import 'package:arquitetura_flutter/app/viewmodels/change_theme_viewmodel.dart';
import 'package:arquitetura_flutter/app/viewmodels/user_viewmodel.dart';
import 'package:get_it/get_it.dart';

sealed class GetItInject {
  static final getIt = GetIt.instance;

  static void setupInject() {
    getIt.registerLazySingleton(
        () => UserController(viewmodel: getIt<UserViewmodel>()));
    getIt.registerLazySingleton(
        () => UserViewmodel(userRepository: getIt<UserRepository>()));
    getIt.registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(clientInterface: getIt<ClientService>()));
    getIt.registerLazySingleton<ClientService>(() => ClientServiceImpl());

    getIt.registerSingleton<LocalStoreService>(LocalStoreServiceImpl());
    getIt.registerSingleton(
        ChangeThemeViewmodel(shared: getIt<LocalStoreService>()));
    getIt.registerSingleton(
        HomeController(changeThemeViewmodel: getIt<ChangeThemeViewmodel>()));
  }
}
