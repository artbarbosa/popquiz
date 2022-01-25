import 'package:flutter/material.dart';
import 'package:popquiz/src/core/models/questionario_model.dart';
import 'package:popquiz/src/features/screens/answered_page.dart';
import 'package:popquiz/src/features/stores/controller_store.dart';
import 'questoes_container.dart';

class AnsweredContainer extends StatelessWidget {
  const AnsweredContainer({
    Key? key,
    required this.onItemTap,
    required this.controller,
  }) : super(key: key);
  final ControllerStore controller;
  final Function(String, QuestoesArguments) onItemTap;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<QuestionarioModel>>(
      future: controller.refreshQuestionaios(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return AnsweredPage(
            controller: controller,
            list: snapshot.data!,
            onItemTap: onItemTap,
          );
        }
        return Container();
      },
    );
  }
}
