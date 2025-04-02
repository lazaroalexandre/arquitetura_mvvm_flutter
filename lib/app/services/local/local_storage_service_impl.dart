// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:arquitetura_flutter/app/services/local/local_storage_service.dart';

class LocalStoreServiceImpl implements LocalStorageService {
  final FlutterSecureStorage storage;
  LocalStoreServiceImpl({
    required this.storage,
  });

  @override
  Future delete(String key) async {
    return await storage.delete(key: key);
  }

  @override
  Future get(String key) async {
    return await storage.read(key: key);
  }

  @override
  Future put(String key, value) async {
    return await storage.write(key: key, value: value.toString());
  }
}
