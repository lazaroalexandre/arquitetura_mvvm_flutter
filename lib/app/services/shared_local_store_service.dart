import 'package:arquitetura_flutter/app/interfaces/local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLocalStoreService implements LocalStorageInterface {
  @override
  Future delete(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.remove(key);
  }

  @override
  Future get(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.get(key);
  }

  @override
  Future put(String key, dynamic value) async {
    var shared = await SharedPreferences.getInstance();
    shared.setBool(key, value);
  }
}
