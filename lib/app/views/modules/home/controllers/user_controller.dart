// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/models/user_model.dart';
import 'package:flutter/material.dart';

import 'package:arquitetura_flutter/app/viewmodels/user_viewmodel.dart';

class UserController extends ChangeNotifier {
  final UserViewmodel _viewmodel;
  UserController({
    required UserViewmodel viewmodel,
  }) : _viewmodel = viewmodel;

  ValueNotifier<List<UserModel>> get users => _viewmodel.filterUsers;

  ValueNotifier<bool> get isLoading => _viewmodel.isLoading;

  getAllUsers() async {
    await _viewmodel.listAll();
    notifyListeners();
  }

  postUser(UserModel userModel) async {
    await _viewmodel.create(userModel);
    getAllUsers();
    notifyListeners();
  }

  filterUsers(String value) {
    _viewmodel.listFilter(value);
    notifyListeners();
  }

  deleteUser(String id) async {
    await _viewmodel.remove(id);
    getAllUsers();
    notifyListeners();
  }

  putUser(UserModel userModel, String id) async {
    await _viewmodel.update(userModel, id);
    getAllUsers();
    notifyListeners();
  }
}
