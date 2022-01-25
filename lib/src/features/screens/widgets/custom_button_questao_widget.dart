import 'package:flutter/material.dart';
import 'package:popquiz/src/core/consts/colors_consts.dart';
import 'package:popquiz/src/core/models/questionario_model.dart';
import 'package:popquiz/src/features/screens/containers/questoes_container.dart';
import 'package:popquiz/src/features/stores/controller_store.dart';

class CustomButtonQuestaoWidget extends StatelessWidget {
  const CustomButtonQuestaoWidget(
      {Key? key,
      required this.questionarioModel,
      required this.formKey,
      required this.controller,
      required this.arguments,
      required this.currentHeight,
      required this.currentWidth})
      : super(key: key);
  final QuestionarioModel questionarioModel;
  final GlobalKey<FormState> formKey;
  final ControllerStore controller;
  final QuestoesArguments arguments;
  final double currentHeight;
  final double currentWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 6,
          side: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          fixedSize: Size(currentWidth * 0.65, currentWidth * 0.15),
          primary: ColorsConst.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
        ),
        child: questionarioModel.respondido == true
            ? const Text('Nova resposta',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
            : const Text('Adicionar Resposta',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            if (questionarioModel.respondido == false) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Respondido'),
                ),
              );
              controller.isRespondido(questionarioModel);
              Navigator.of(context).pushReplacementNamed('/respondidoConfirm',
                  arguments: arguments);
            } else {
              Navigator.of(context).pushReplacementNamed('/novamenteConfirm',
                  arguments: arguments);
            }
          }
        },
      ),
    );
  }
}
