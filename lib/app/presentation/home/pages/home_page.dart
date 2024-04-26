import 'package:arquitetura_flutter/app/presentation/home/components/app_bar_widget.dart';
import 'package:arquitetura_flutter/app/presentation/home/components/list_user_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(text: "Meus Contatos"),
      body: const ListUserWidget(),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: const Icon(Icons.add),),
    );
  }
}
