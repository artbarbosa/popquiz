import 'package:flutter/material.dart';
import 'package:popquiz/src/core/consts/colors_consts.dart';
import 'package:popquiz/src/features/stores/controller_store.dart';
import 'containers/questoes_container.dart';

class ResponderNovamenteConfirmPage extends StatelessWidget {
  ResponderNovamenteConfirmPage(
      {Key? key, required this.controller, required this.arguments})
      : super(key: key);
  QuestoesArguments arguments;
  final ControllerStore controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsConst.primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Deseja responder novamente ?',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/questoes',
                            arguments: arguments);
                      },
                      child: const Text(
                        'Não',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                      ),
                      onPressed: () {
                        controller.isRespondido(arguments.questionarioModel);
                        Navigator.of(context).pushReplacementNamed('/questoes',
                            arguments: arguments);
                      },
                      child: const Text(
                        'Sim',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
