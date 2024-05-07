// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:arquitetura_flutter/app/modules/home/models/user_model.dart';
import 'package:arquitetura_flutter/app/core/viewmodel/user_viewmodel.dart';

class UserController extends ChangeNotifier {
  final UserViewmodel viewmodel;
  UserController({
    required this.viewmodel,
  });

  ValueNotifier<List<UserModel>> get users => viewmodel.users;

  ValueNotifier<bool> get isLoading => viewmodel.isLoading;

  ValueNotifier<String> get error => viewmodel.error;

  getAllUsers() async {
    await viewmodel.listAll();
    notifyListeners();
  }

  postUser(UserModel userModel) async {
    await viewmodel.create(userModel);
    getAllUsers();
    notifyListeners();
  }

  filterUsers(String value) {
    viewmodel.listFilter(value);
    notifyListeners();
  }

  deleteUser(String id) async {
    await viewmodel.remove(id);
    getAllUsers();
    notifyListeners();
  }

  putUser(UserModel userModel, String id) async {
    await viewmodel.update(userModel, id);
    getAllUsers();
    notifyListeners();
  }
}
