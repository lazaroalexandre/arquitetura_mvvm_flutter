import 'package:arquitetura_flutter/app/utils/messages/error_message.dart';
import 'package:arquitetura_flutter/app/utils/api/route_api_constant.dart';
import 'package:arquitetura_flutter/app/utils/exceptions/app_exception.dart';
import 'package:arquitetura_flutter/app/models/user_model.dart';
import 'package:arquitetura_flutter/app/services/client/client_service.dart';
import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ClientService clientService;
  UserRepositoryImpl({
    required this.clientService,
  });

  @override
  AsyncResult<Unit> deleteUser(String id) async {
    try {
      await clientService.delete('${RouteApiContant.userURL}/$id');
      return const Success(unit);
    } on DioException catch (e) {
      return Failure(ClientException(
          message: ErrorMessage.delete,
          code: e.response?.statusCode,
          response: e.response));
    }
  }

  @override
  AsyncResult<List<UserModel>> getUsers() async {
    try {
      final Response response =
          await clientService.get(RouteApiContant.userURL);
      final List<dynamic> data = response.data;
      final List<UserModel> result = data
          .map((item) => UserModel.fromMap(item as Map<String, dynamic>))
          .toList();
      return Success(result);
    } on DioException catch (e) {
      return Failure(ClientException(
          message: ErrorMessage.get,
          code: e.response?.statusCode,
          response: e.response));
    }
  }

  @override
  AsyncResult<UserModel> postUser(UserModel userModel) async {
    try {
      final Response response =
          await clientService.post(RouteApiContant.userURL, userModel.toMap());
      final result = UserModel.fromMap(response.data);
      return Success(result);
    } on DioException catch (e) {
      return Failure(ClientException(
          message: ErrorMessage.post,
          code: e.response?.statusCode,
          response: e.response));
    }
  }

  @override
  AsyncResult<UserModel> putUser(UserModel userModel, String id) async {
    try {
      final Response response = await clientService.put(
          "${RouteApiContant.userURL}/$id", userModel.toMap());
      final result = UserModel.fromMap(response.data);
      return Success(result);
    } on DioException catch (e) {
      return Failure(ClientException(
          message: ErrorMessage.put,
          code: e.response?.statusCode,
          response: e.response));
    }
  }
}
