sealed class SuccessMessage {
  static const String title = 'Sucesso!';
  static String getMessageUserContactRegister(String name) =>
      'Foi adicionado o contato $name no sistema.';
  static String getMessageUserContactUpdate(String name) =>
      'O contato $name teve dados modificados no sistema.';
  static const String userContactDeleteMessage = 
      'O contato foi removido do sistema.';
}
