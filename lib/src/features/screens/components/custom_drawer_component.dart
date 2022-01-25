import 'package:flutter/material.dart';

class CustomDrawerComponent extends StatelessWidget {
  const CustomDrawerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Todos os questionionarios'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.checklist),
            title: const Text('Questionarios respondidos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/answered');
            },
          ),
          ListTile(
            leading: const Icon(Icons.toc),
            title: const Text('Questionarios não respondidos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/unanswered');
            },
          )
        ],
      ),
    );
  }
}
