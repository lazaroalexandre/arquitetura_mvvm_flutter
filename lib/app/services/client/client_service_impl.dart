import 'package:arquitetura_flutter/app/services/client/client_service.dart';
import 'package:dio/dio.dart';

class ClientServiceImpl implements ClientService {
  final Dio dio = Dio();

  @override
  void addToken(String token) {}

  @override
  Future get(String url) async {
    return await dio.get(url);
  }

  @override
  Future post(String url, Object data) async {
    return await dio.post(url, data: data);
  }

  @override
  Future delete(String url) async {
    return await dio.delete(url);
  }

  @override
  Future put(String url, Object data) async {
    return await dio.put(url, data: data);
  }
}
