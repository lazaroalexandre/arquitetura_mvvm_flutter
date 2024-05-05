import 'package:arquitetura_flutter/app/models/user_model.dart';

abstract interface class UserRepository {
  Future<List<UserModel>> getUsers();
  Future<UserModel> postUser(UserModel userModel);
  Future<void> deleteUser(String id);
  Future<UserModel> putUser(UserModel userModel, String id);
}
