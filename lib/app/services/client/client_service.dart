abstract interface class ClientService {
  Future get(String url);
  Future post(String url, Object data);
  Future delete(String url);
  Future put(String url, Object data);
}