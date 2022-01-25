import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:popquiz/src/features/routes.dart';
import 'package:popquiz/src/features/stores/controller_store.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);
  final ControllerStore controller = ControllerStore();
  @override
  Widget build(BuildContext context) {
    controller.getQuestionarios();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Routes(
        controller: controller,
      ),
    );
  }
}
