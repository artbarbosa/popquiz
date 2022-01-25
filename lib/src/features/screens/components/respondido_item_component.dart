import 'package:flutter/material.dart';
import 'package:popquiz/src/core/models/questionario_model.dart';
import 'package:popquiz/src/features/stores/controller_store.dart';

class RespondidoItemComponent extends StatelessWidget {
  const RespondidoItemComponent(
      {Key? key,
      required this.questoes,
      required this.controller,
      required this.index})
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
          const SizedBox(height: 7),
          Text(
            questoes.descricao!,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
          ),
          const SizedBox(height: 7),
          const Text(
            'Resposta:',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
          ),
          const SizedBox(height: 5),
          Text(
            questoes.resposta!,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
