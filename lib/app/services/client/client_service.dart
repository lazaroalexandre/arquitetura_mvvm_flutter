abstract interface class ClientService {
  void addToken(String token);
  Future get(String url);
}
