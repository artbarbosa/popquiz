import 'package:flutter/material.dart';
import 'package:popquiz/src/core/consts/colors_consts.dart';
import 'package:popquiz/src/core/models/questionario_model.dart';
import 'package:popquiz/src/features/stores/controller_store.dart';

import 'components/custom_drawer_component.dart';
import 'components/questionario_item_component.dart';
import 'containers/questoes_container.dart';

class HomePage extends StatelessWidget {
  const HomePage(
      {Key? key,
      required this.list,
      required this.onItemTap,
      required this.controller})
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
            //Mostra todos os  quetionairo
            children: list
                .map(
                  (e) => QuestionarioItemComponent(
                    list: list,
                    controller: controller,
                    questionarioModel: e,
                    index: list.indexOf(e),
                    onTap: onItemTap,
                  ),
                )
                .toList(),
          );
        },
      ),
      //Direciona para Pagina de novo Questionario
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
