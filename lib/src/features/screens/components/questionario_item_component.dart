import 'package:flutter/material.dart';
import 'package:popquiz/src/core/models/questionario_model.dart';
import 'package:popquiz/src/features/screens/containers/questoes_container.dart';
import 'package:popquiz/src/features/stores/controller_store.dart';

class QuestionarioItemComponent extends StatelessWidget {
  const QuestionarioItemComponent({
    Key? key,
    required this.questionarioModel,
    required this.onTap,
    required this.index,
    required this.controller, required this.list,
  }) : super(key: key);
  final QuestionarioModel questionarioModel;
  final Function(String, QuestoesArguments) onTap;
  final int index;
  final ControllerStore controller;
  final List<QuestionarioModel> list;


  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(questionarioModel.titulo!),
        onTap: () => onTap(
              '/questoes',
              QuestoesArguments(
                  questionarioModel: questionarioModel, index: index),
            ),
        trailing: SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  controller.removeQuestionario(list,index);
                  Navigator.of(context).pushReplacementNamed('/');
                },
              ),
              questionarioModel.respondido == true
                  ? const Icon(
                      Icons.check_box,
                      color: Colors.green,
                    )
                  : const Icon(Icons.check_box_outline_blank),
            ],
          ),
        ));
  }
}
