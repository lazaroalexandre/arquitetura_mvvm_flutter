import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'package:arquitetura_flutter/app/utils/messages/error_message.dart';
import 'package:arquitetura_flutter/app/utils/messages/success_message.dart';

import './app_message_service.dart';

class AppMessageServiceImpl implements AppMessageService {
  final GlobalKey<NavigatorState> navigatorKey;
  
  AppMessageServiceImpl({required this.navigatorKey});

  @override
  void showMessageSuccess(String message) {
    if (navigatorKey.currentContext != null) {
      late Flushbar flushbar;

      flushbar = Flushbar(
        title: SuccessMessage.title,
        message: message,
        duration: const Duration(seconds: 5),
        icon: const Icon(
          Icons.task_alt_outlined,
          color: Color(0xff009531),
        ),
        leftBarIndicatorColor: const Color(0xff009531),
        mainButton: InkWell(
          onTap: () => flushbar.dismiss(), 
          child: const Icon(
            Icons.close,
            color: Colors.white38,
          ),
        ),
      );

      flushbar.show(navigatorKey.currentContext!);
    }
  }

  @override
  void showMessageError(String message) {
    if (navigatorKey.currentContext != null) {
      late Flushbar flushbar;

      flushbar = Flushbar(
        title: ErrorMessage.title,
        message: message,
        duration: const Duration(seconds: 5),
        icon: const Icon(
          Icons.error_outline,
          color: Color(0xffF60000),
        ),
        leftBarIndicatorColor: const Color(0xffF60000),
        mainButton: InkWell(
          onTap: () => flushbar.dismiss(),
          child: const Icon(
            Icons.close,
            color: Colors.white38,
          ),
        ),
      );

      flushbar.show(navigatorKey.currentContext!);
    }
  }
}
