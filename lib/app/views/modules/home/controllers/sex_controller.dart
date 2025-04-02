import 'package:flutter/material.dart';

class SexController extends ChangeNotifier {
  final _selectSex = ValueNotifier<String>('Masculino');
  ValueNotifier<String> get selectSex => _selectSex;

  setSex(String sex) {
    _selectSex.value = sex;
    notifyListeners();
  }
}
