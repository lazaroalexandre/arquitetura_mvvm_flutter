import 'package:arquitetura_flutter/app/models/user_model.dart';
import 'package:arquitetura_flutter/app/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class UserViewmodel {
  final UserRepository userRepository;
  UserViewmodel({
    required this.userRepository,
  });

  final users = ValueNotifier<List<UserModel>>([]);

  final filterUsers = ValueNotifier<List<UserModel>>([]);

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  listAll() async {
    isLoading.value = true;

    final result = await userRepository.getUsers();

    result.fold((success) {
      users.value = success;
      filterUsers.value = users.value;
    }, (failure) => failure);

    isLoading.value = false;
  }

  listFilter(String value) {
    if (value.isNotEmpty) {
      filterUsers.value = users.value
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()) ||
              element.job.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      filterUsers.value = users.value;
    }
  }

  create(UserModel userModel) async {
    isLoading.value = true;

    final result = await userRepository.postUser(userModel);

    result.fold((success) {}, (failure) => failure);

    isLoading.value = false;
  }

  remove(String id) async {
    isLoading.value = true;

    final result = await userRepository.deleteUser(id);

    result.fold((success) {}, (failure) => failure);

    isLoading.value = false;
  }

  update(UserModel userModel, String id) async {
    isLoading.value = true;

    final result = await userRepository.putUser(userModel, id);

    result.fold((success) {}, (failure) => failure);

    isLoading.value = false;
  }
}