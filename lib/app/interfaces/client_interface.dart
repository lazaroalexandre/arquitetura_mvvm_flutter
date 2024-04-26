abstract interface class ClientInterface {
  void addToken(String token);
  Future get(String url);
}
