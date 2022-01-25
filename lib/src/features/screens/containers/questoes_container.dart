import 'package:flutter/material.dart';
import 'package:popquiz/src/core/models/questionario_model.dart';
import 'package:popquiz/src/features/stores/controller_store.dart';

import '../questoes_page.dart';

class QuestoesArguments {
  QuestoesArguments({this.index = 0, required this.questionarioModel});
  final QuestionarioModel questionarioModel;
  final int? index;
}

class QuestoesContainer extends StatelessWidget {
  QuestoesContainer({Key? key, required this.arguments}) : super(key: key);
  final QuestoesArguments arguments;
  QuestionarioModel? _questionarioModel;
  final ControllerStore controller = ControllerStore();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<QuestionarioModel>>(
      future: controller.repository.getQuestionarios(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          _questionarioModel ??= arguments.questionarioModel;
          return QuestoesPage(
            arguments: arguments,
            controller: controller,
            questionarioModel: _questionarioModel!,
          );
        }
        return Container();
      },
    );
  }
}
