// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  bool value = false;

  @action
  void change() {
    value = !value;
  }

  @action
  ThemeData theme() {
    return value ? ThemeData.dark() : ThemeData.light();
  }
}
