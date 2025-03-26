// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/utils/messages/error_message.dart';
import 'package:dio/dio.dart';

sealed class AppException implements Exception {
  final String message;

  AppException({
    required this.message,
  });
}

class ClientException extends AppException {
  final int? code;
  final Response? response;

  ClientException({
    required String message,
    this.code = 500,
    this.response,
  }) : super(message: code == 500 ? ErrorMessage.server : message);
}
