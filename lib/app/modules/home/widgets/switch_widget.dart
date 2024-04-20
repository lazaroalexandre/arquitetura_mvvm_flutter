import 'package:arquitetura_flutter/app/modules/home/controllers/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SwitchWidget extends StatelessWidget {
  SwitchWidget({super.key});
  final controller = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Switch(
          value: controller.value,
          onChanged: (_) => controller.change(),
        );
      }
    );
  }
}
