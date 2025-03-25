// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shared_preferences/shared_preferences.dart';

import 'package:arquitetura_flutter/app/services/local/local_storage_service.dart';

class LocalStoreServiceImpl implements LocalStorageService {
  final SharedPreferences sharedPreferences;
  LocalStoreServiceImpl({
    required this.sharedPreferences,
  });

  @override
  Future delete(String key) async {
    return await sharedPreferences.remove(key);
  }

  @override
  Future get(String key) async {
    return sharedPreferences.get(key);
  }

  @override
  Future put(String key, dynamic value) async {
    return await sharedPreferences.setBool(key, value);
  }
}
