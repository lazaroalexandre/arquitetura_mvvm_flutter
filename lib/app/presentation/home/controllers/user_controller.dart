// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/repositories/user_repository_impl.dart';
import 'package:arquitetura_flutter/app/services/client/client_service_impl.dart';
import 'package:flutter/material.dart';

import 'package:arquitetura_flutter/app/models/user_model.dart';
import 'package:arquitetura_flutter/app/viewmodels/user_viewmodel.dart';

class UserController extends ChangeNotifier{
  static final UserController instance = UserController._();

  UserController._() {
    viewmodel.fill();
  }

  final UserViewmodel viewmodel = UserViewmodel(
      userRepository: UserRepositoryImpl(clientInterface: ClientServiceImpl()));

  ValueNotifier<List<UserModel>> get users => viewmodel.users;

  ValueNotifier<bool> get isLoading => viewmodel.isLoading;

  ValueNotifier<String> get error => viewmodel.error;

  getUsers() async {
    await viewmodel.fill();
    notifyListeners();
  }
}
