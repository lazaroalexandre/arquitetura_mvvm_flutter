// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:arquitetura_flutter/app/models/user_model.dart';

class ListTileWidget extends StatelessWidget {
  final UserModel model;

  const ListTileWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
        model.avatar,
        style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
      ),
      ),
      title: Text(
        model.name,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        "${model.job} | ${model.sex} | ${model.email} | ${model.phone}",
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
