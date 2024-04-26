import 'package:arquitetura_flutter/app/interfaces/client_interface.dart';
import 'package:dio/dio.dart';

class ClientService implements ClientInterface {
  final Dio dio = Dio();

  @override
  void addToken(String token) {}

  @override
  Future get(String url) async {
    return await dio.get(url);
  }
}
