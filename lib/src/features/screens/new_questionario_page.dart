import 'package:flutter/material.dart';
import 'package:popquiz/src/core/consts/colors_consts.dart';
import 'package:popquiz/src/core/models/questionario_model.dart';
import 'package:popquiz/src/features/stores/controller_store.dart';
import 'containers/questoes_container.dart';
import 'widgets/textfield_new_questionario_widget.dart';

class NewQuestionarioPage extends StatelessWidget {
  NewQuestionarioPage({
    Key? key,
    required this.controller,
    required this.list,
    required this.onItemTap,
  }) : super(key: key);
  final ControllerStore controller;
  final List<QuestionarioModel> list;
  final Function(String, QuestoesArguments) onItemTap;
  final QuestionarioModel questionarioModel = QuestionarioModel(questoes: []);
  final List<Questoes> listQuestoes = [];
  final Questoes questoes = Questoes();
  final int count = 0;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final double currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsConst.primaryColor,
          title: const Text('Novo Questionario'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TexfieldNewQuestionarioWidget(
                  label: 'Titulo',
                  onSaved: (text) {
                    questionarioModel.titulo = text;
                  },
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  onPressed: () {},
                  child: const Text('Adicionar Questão'),
                ),
                const SizedBox(height: 5),
                /*
                TexfieldNewQuestionarioWidget(
                  label: 'Questão Titulo:',
                  onSaved: (text) {
                    questoes.titulo = text;
                  },
                ),
                TexfieldNewQuestionarioWidget(
                  label: 'Questão Descrição:',
                  onSaved: (text) {
                    questoes.descricao = text;
                  },
                ),*/
                const SizedBox(height: 5),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 6,
                    side: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    fixedSize: Size(currentWidth * 0.65, currentWidth * 0.15),
                    primary: const Color(0xFFFF9E00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  child: const Text('Adicionar Questionario',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      formKey.currentState?.save();
                      controller.addQuestionario(
                        list,
                        QuestionarioModel(
                          id: list.last.id! + 1,
                          titulo: questionarioModel.titulo,
                          questoes: listQuestoes,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Adicionado')));
                      Navigator.of(context).pushReplacementNamed('/');
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
