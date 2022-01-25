import 'package:flutter/material.dart';
import 'package:popquiz/src/core/consts/colors_consts.dart';
import 'containers/questoes_container.dart';

class RespondidoConfirmPage extends StatelessWidget {
  RespondidoConfirmPage({Key? key, required this.arguments}) : super(key: key);
  QuestoesArguments arguments;

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
              'Respostas efetuadas com sucesso',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed('/questoes', arguments: arguments);
                },
                child: const Text(
                  'Certo',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
