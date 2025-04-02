import 'package:flutter/material.dart';

sealed class ErrorMessage {
  static const String post = 'Houve um erro ao salvar dados!';
  static const String get = 'Houve um erro ao filtrar dados!';
  static const String put = 'Houve um erro ao atualizar dados!';
  static const String delete = 'Houve um erro ao apagar dados!';
  static const String server = 'Estamos fora do ar.';
  static const String tryAgainLater = 'Tente novamente mais tarde.';
  static const String title = 'Erro!';

  static String required(BuildContext context) => 'Campo Obrigatório!';
  static String email(BuildContext context) => 'O campo deve ter formato de e-mail!';
  static String phoneMin(BuildContext context) => 'O campo deve ter no mínimo 11 dígitos!';
  static String phoneMax(BuildContext context) => 'O campo deve ter no máximo 11 dígitos';
}
