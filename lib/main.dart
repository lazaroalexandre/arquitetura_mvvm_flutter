import 'package:arquitetura_flutter/app/get_it_inject.dart';
import 'package:flutter/material.dart';
import 'app/app_widget.dart';

void main() {
  GetItInject.setupInject();
  runApp(AppWidget());
}
