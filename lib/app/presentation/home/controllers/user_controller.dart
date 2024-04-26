// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:arquitetura_flutter/app/models/user_model.dart';
import 'package:arquitetura_flutter/app/viewmodels/user_viewmodel.dart';

class UserController extends ChangeNotifier {
  final UserViewmodel viewmodel;
  UserController({
    required this.viewmodel,
  });

  ValueNotifier<List<UserModel>> get users => viewmodel.users;

  getUsers() async{
    await viewmodel.fill();
    notifyListeners();
  }
}
