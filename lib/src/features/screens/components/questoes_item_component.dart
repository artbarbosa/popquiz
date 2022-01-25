import 'package:flutter/material.dart';
import 'package:popquiz/src/core/models/questionario_model.dart';
import 'package:popquiz/src/features/stores/controller_store.dart';

class QuestoesItemComponent extends StatelessWidget {
  const QuestoesItemComponent(
      {Key? key,
      required this.questoes,
      required this.index,
      required this.controller})
      : super(key: key);
  final Questoes questoes;
  final ControllerStore controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            questoes.titulo!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 5),
          Text(questoes.descricao!,
              style:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
          SizedBox(
              width: 400,
              child: TextFormField(
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Esse campo não pode ser vazio';
                  }
                },
                onSaved: (text) {
                  questoes.addResposta(questoes.id!, text!);
                },
                decoration: const InputDecoration(
                  fillColor: Colors.black,
                  focusColor: Colors.black,
                  border: OutlineInputBorder(),
                ),
              ))
        ],
      ),
    );
  }
}
