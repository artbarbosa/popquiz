import 'package:flutter/material.dart';
import 'package:popquiz/src/core/consts/colors_consts.dart';
import 'package:popquiz/src/core/models/questionario_model.dart';
import 'package:popquiz/src/features/stores/controller_store.dart';
import 'components/questoes_item_component.dart';
import 'components/respondido_item_component.dart';
import 'containers/questoes_container.dart';
import 'widgets/custom_button_questao_widget.dart';

class QuestoesPage extends StatelessWidget {
  QuestoesPage({
    Key? key,
    required this.questionarioModel,
    required this.controller,
    required this.arguments,
  }) : super(key: key);
  final QuestoesArguments arguments;
  final QuestionarioModel questionarioModel;
  final ControllerStore controller;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsConst.primaryColor,
        title: Text(questionarioModel.titulo!),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            // Se o questionairo não foi Respondido
            if (questionarioModel.respondido == false ||
                questionarioModel.respondido == null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: questionarioModel.questoes
                        .map(
                          (e) => QuestoesItemComponent(
                            controller: controller,
                            questoes: e,
                            index: questionarioModel.questoes.indexOf(e),
                          ),
                        )
                        .toList(),
                  ),
                  CustomButtonQuestaoWidget(
                    currentHeight: currentHeight,
                    currentWidth: currentWidth,
                    arguments: arguments,
                    controller: controller,
                    formKey: formKey,
                    questionarioModel: questionarioModel,
                  )
                ],
              );
            }
            // Se o questionairo já foi Respondido
            else if (questionarioModel.respondido == true) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: questionarioModel.questoes
                        .map(
                          (e) => RespondidoItemComponent(
                            controller: controller,
                            questoes: e,
                            index: questionarioModel.questoes.indexOf(e),
                          ),
                        )
                        .toList(),
                  ),
                  CustomButtonQuestaoWidget(
                    currentHeight: currentHeight,
                    currentWidth: currentWidth,
                    arguments: arguments,
                    controller: controller,
                    formKey: formKey,
                    questionarioModel: questionarioModel,
                  )
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
