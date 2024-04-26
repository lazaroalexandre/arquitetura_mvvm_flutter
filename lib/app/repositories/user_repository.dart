import 'package:arquitetura_flutter/app/models/user_model.dart';

abstract interface class UserRepository {
  Future<List<UserModel>> getUsers();
}
