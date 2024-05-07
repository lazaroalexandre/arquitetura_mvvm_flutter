// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/core/exceptions/exception_not_found.dart';
import 'package:arquitetura_flutter/app/modules/home/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:arquitetura_flutter/app/modules/home/repositories/user_repository.dart';

class UserViewmodel {
  final UserRepository userRepository;
  UserViewmodel({
    required this.userRepository,
  });

  final originalUsers = ValueNotifier<List<UserModel>>([]);

  final users = ValueNotifier<List<UserModel>>([]);

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final error = ValueNotifier<String>('');

  listAll() async {
    try {
      isLoading.value = true;
      originalUsers.value = await userRepository.getUsers();
      users.value = originalUsers.value;
    } on ExceptionNotFound catch (exception) {
      error.value = exception.message;
    } catch (exception) {
      error.value = exception.toString();
    } finally {
      isLoading.value = false;
    }
  }

  listFilter(String value) {
    if (value.isNotEmpty) {
      users.value = originalUsers.value
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()) ||
              element.job.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      users.value = originalUsers.value;
    }
  }

  create(UserModel userModel) async {
    try {
      isLoading.value = true;
      await userRepository.postUser(userModel);
    } on ExceptionNotFound catch (exception) {
      error.value = exception.message;
    } catch (exception) {
      error.value = exception.toString();
    } finally {
      isLoading.value = false;
    }
  }

  remove(String id) async {
    try {
      isLoading.value = true;
      await userRepository.deleteUser(id);
    } on ExceptionNotFound catch (exception) {
      error.value = exception.message;
    } catch (exception) {
      error.value = exception.toString();
    } finally {
      isLoading.value = false;
    }
  }

  update(UserModel userModel, String id) async {
    try {
      isLoading.value = true;
      await userRepository.putUser(userModel, id);
    } on ExceptionNotFound catch (exception) {
      error.value = exception.message;
    } catch (exception) {
      error.value = exception.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
