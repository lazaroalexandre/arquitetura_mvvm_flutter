abstract interface class LocalStorageService {
  Future delete(String key);
  Future get(String key);
  Future put(String key, dynamic value);
}
