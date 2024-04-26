// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/interfaces/client_interface.dart';
import 'package:arquitetura_flutter/app/models/user_model.dart';

import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ClientInterface clientInterface;
  UserRepositoryImpl({
    required this.clientInterface,
  });

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await clientInterface
        .get("https://64e50431c555638029140c0f.mockapi.io/user");

    List<UserModel> users = [];

    final body = response.data;

    body.map((user) {
      final UserModel model = UserModel.fromMap(user);
      users.add(model);
    }).toList();

    return users;
  }
}
