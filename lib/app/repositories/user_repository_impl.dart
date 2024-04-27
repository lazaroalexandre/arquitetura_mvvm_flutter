// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/exceptions/exception_not_found.dart';
import 'package:arquitetura_flutter/app/interfaces/client_interface.dart';
import 'package:arquitetura_flutter/app/models/user_model.dart';
import 'package:dio/dio.dart';

import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ClientInterface clientInterface;
  UserRepositoryImpl({
    required this.clientInterface,
  });

  @override
  Future<List<UserModel>> getUsers() async {
    final Response response = await clientInterface
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
}
