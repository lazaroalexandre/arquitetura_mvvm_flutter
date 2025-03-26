import 'package:arquitetura_flutter/app/models/user_model.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class UserRepository {
  AsyncResult<List<UserModel>> getUsers();
  AsyncResult<UserModel> postUser(UserModel userModel);
  AsyncResult<Unit> deleteUser(String id);
  AsyncResult<UserModel> putUser(UserModel userModel, String id);
}
