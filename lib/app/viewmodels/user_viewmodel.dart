// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:arquitetura_flutter/app/repositories/user_repository.dart';

class UserViewmodel {
  final UserRepository userRepository;
  UserViewmodel({
    required this.userRepository,
  });

  final users = ValueNotifier<List<UserModel>>([]);

  fill() async {
    users.value = await userRepository.getUsers();
  }
}
