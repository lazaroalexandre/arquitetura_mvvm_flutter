import 'package:dio/dio.dart';

import './client_service.dart';

class ClientServiceImpl implements ClientService {
  final Dio dio;
  ClientServiceImpl({
    required this.dio,
  });

  @override
  Future delete(String url) async {
    return await dio.delete(url);
  }

  @override
  Future get(String url) async {
    return await dio.get(url);
  }

  @override
  Future post(String url, Object data) async {
    return await dio.post(url, data: data);
  }

  @override
  Future put(String url, Object data) async {
    return await dio.put(url, data: data);
  }
}
