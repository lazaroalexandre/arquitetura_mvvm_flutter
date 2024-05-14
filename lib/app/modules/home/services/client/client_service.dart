abstract interface class ClientService {
  void addToken(String token);
  Future get(String url);
  Future post(String url, Object data);
  Future delete(String url);
  Future put(String url, Object data);
}
