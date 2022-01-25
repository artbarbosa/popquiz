import 'package:flutter/material.dart';
import 'package:popquiz/src/features/screens/containers/new_questionario_container.dart';
import 'package:popquiz/src/features/stores/controller_store.dart';
import 'screens/containers/answered_container.dart';
import 'screens/containers/questoes_container.dart';
import 'screens/containers/home_container.dart';
import 'screens/containers/unanswered_page.dart';
import 'screens/responder_novamente_confirm_page.dart';
import 'screens/respondido_confirm_page.dart';

class Routes extends StatelessWidget {
  const Routes({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ControllerStore controller;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              return HomeContainer(
                controller: controller,
                onItemTap: (route, arguments) {
                  Navigator.of(context)
                      .pushReplacementNamed(route, arguments: arguments);
                },
              );
            },
          );
        }
        if (settings.name == '/questoes') {
          return MaterialPageRoute(
            builder: (context) {
              return QuestoesContainer(
                arguments: (settings.arguments as QuestoesArguments),
              );
            },
          );
        }
        if (settings.name == '/respondidoConfirm') {
          return MaterialPageRoute(
            builder: (context) {
              return RespondidoConfirmPage(
                arguments: (settings.arguments as QuestoesArguments),
              );
            },
          );
        }
        if (settings.name == '/novamenteConfirm') {
          return MaterialPageRoute(
            builder: (context) {
              return ResponderNovamenteConfirmPage(
                arguments: (settings.arguments as QuestoesArguments),
                controller: controller,
              );
            },
          );
        }
        if (settings.name == '/answered') {
          return MaterialPageRoute(
            builder: (context) {
              return AnsweredContainer(
                controller: controller,
                onItemTap: (route, arguments) {
                  Navigator.of(context)
                      .pushReplacementNamed(route, arguments: arguments);
                },
              );
            },
          );
        }
        if (settings.name == '/unanswered') {
          return MaterialPageRoute(
            builder: (context) {
              return UnansweredContainer(
                controller: controller,
                onItemTap: (route, arguments) {
                  Navigator.of(context)
                      .pushReplacementNamed(route, arguments: arguments);
                },
              );
            },
          );
        }
          if (settings.name == '/new') {
          return MaterialPageRoute(
            builder: (context) {
              return NewQuestionarioContainer(
                controller: controller,
                onItemTap: (route, arguments) {
                  Navigator.of(context)
                      .pushReplacementNamed(route, arguments: arguments);
                },
              );
            },
          );
        }
      },
    );
  }
}
