// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/exceptions/exception_not_found.dart';
import 'package:arquitetura_flutter/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:arquitetura_flutter/app/repositories/user_repository.dart';

class UserViewmodel {
  final UserRepository userRepository;
  UserViewmodel({
    required this.userRepository,
  });

  final users = ValueNotifier<List<UserModel>>([]);

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final error = ValueNotifier<String>('');

  fill() async {
    try {
      isLoading.value = true;
      users.value = await userRepository.getUsers();
    } on ExceptionNotFound catch (exception) {
      error.value = exception.message;
    } catch (exception) {
      error.value = exception.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
