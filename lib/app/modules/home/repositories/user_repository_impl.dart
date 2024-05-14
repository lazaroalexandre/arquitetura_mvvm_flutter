// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/core/exceptions/exception_not_found.dart';
import 'package:arquitetura_flutter/app/modules/home/models/user_model.dart';
import 'package:arquitetura_flutter/app/modules/home/services/client/client_service.dart';
import 'package:dio/dio.dart';

import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ClientService clientService;
  UserRepositoryImpl({
    required this.clientService,
  });

  @override
  Future<List<UserModel>> getUsers() async {
    final Response response = await clientService
        .get("https://64e50431c555638029140c0f.mockapi.io/user");

    if (response.statusCode == 200) {
      List<UserModel> users = [];
      final body = response.data;
      body.map((user) {
        final UserModel model = UserModel.fromMap(user);
        users.add(model);
      }).toList();

      return users;
    } else if (response.statusCode == 404) {
      throw ExceptionNotFound(message: "A url não foi encontrada!");
    } else {
      throw Exception("Não foi possível carregar os contatos!");
    }
  }

  @override
  Future<UserModel> postUser(UserModel userModel) async {
    final Response response = await clientService.post(
        "https://64e50431c555638029140c0f.mockapi.io/user", userModel.toJson());

    if (response.statusCode == 201) {
      return UserModel.fromMap(response.data);
    } else if (response.statusCode == 404) {
      throw ExceptionNotFound(message: "A url não foi encontrada!");
    } else {
      throw Exception("Não foi possível carregar os contatos!");
    }
  }

  @override
  Future<void> deleteUser(String id) async {
    await clientService
        .delete("https://64e50431c555638029140c0f.mockapi.io/user/$id");
  }

  @override
  Future<UserModel> putUser(UserModel userModel, String id) async {
    final Response response = await clientService.put(
        "https://64e50431c555638029140c0f.mockapi.io/user/$id",
        userModel.toJson());
       if (response.statusCode == 200) {
      return UserModel.fromMap(response.data);
    } else if (response.statusCode == 404) {
      throw ExceptionNotFound(message: "A url não foi encontrada!");
    } else {
      throw Exception("Não foi possível carregar os contatos!");
    }
  }
}
