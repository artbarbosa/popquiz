import 'package:flutter/material.dart';
import 'package:popquiz/src/core/consts/colors_consts.dart';
import 'package:popquiz/src/core/models/questionario_model.dart';
import 'package:popquiz/src/features/stores/controller_store.dart';
import 'components/custom_drawer_component.dart';
import 'components/questionario_item_component.dart';
import 'containers/questoes_container.dart';

class AnsweredPage extends StatelessWidget {
  const AnsweredPage(
      {Key? key,
      required this.controller,
      required this.list,
      required this.onItemTap})
      : super(key: key);
  final ControllerStore controller;
  final List<QuestionarioModel> list;
  final Function(String, QuestoesArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Questionarios'),
        backgroundColor: ColorsConst.primaryColor,
      ),
      drawer: const CustomDrawerComponent(),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: list.map(
              (e) {
                //Mostra somente os  quetionairo respondidos
                if (e.respondido == true) {
                  return QuestionarioItemComponent(
                    list: list,
                    controller: controller,
                    questionarioModel: e,
                    index: list.indexOf(e),
                    onTap: onItemTap,
                  );
                }
                return Container();
              },
            ).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: ColorsConst.primaryColor,
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/new');
        },
      ),
    );
  }
}
