// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/utils/messages/error_message.dart';
import 'package:arquitetura_flutter/app/utils/messages/success_message.dart';
import 'package:flutter/material.dart';

import 'package:arquitetura_flutter/app/models/user_model.dart';
import 'package:arquitetura_flutter/app/repositories/user_repository.dart';
import 'package:arquitetura_flutter/app/services/message/app_message_service.dart';

class UserViewmodel {
  final UserRepository userRepository;
  final AppMessageService appMessageService;
  UserViewmodel({
    required this.userRepository,
    required this.appMessageService,
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

    result.fold(
      (success) => appMessageService.showMessageSuccess(
        SuccessMessage.getMessageUserContactRegister(success.name),
      ),
      (failure) => appMessageService.showMessageError(
        SuccessMessage.getMessageUserContactRegister(
            "${ErrorMessage.post} ${ErrorMessage.tryAgainLater}"),
      ),
    );

    isLoading.value = false;
  }

  remove(String id) async {
    isLoading.value = true;

    final result = await userRepository.deleteUser(id);

    result.fold(
      (success) => appMessageService.showMessageSuccess(
        SuccessMessage.userContactDeleteMessage,
      ),
      (failure) => appMessageService.showMessageError(
        SuccessMessage.getMessageUserContactRegister(
            "${ErrorMessage.delete} ${ErrorMessage.tryAgainLater}"),
      ),
    );

    isLoading.value = false;
  }

  update(UserModel userModel, String id) async {
    isLoading.value = true;

    final result = await userRepository.putUser(userModel, id);

    result.fold(
      (success) => appMessageService.showMessageSuccess(
        SuccessMessage.getMessageUserContactUpdate(success.name),
      ),
      (failure) => appMessageService.showMessageError(
        SuccessMessage.getMessageUserContactUpdate(
            "${ErrorMessage.put} ${ErrorMessage.tryAgainLater}"),
      ),
    );

    isLoading.value = false;
  }
}
