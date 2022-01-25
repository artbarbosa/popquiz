import 'package:flutter/material.dart';

class TexfieldNewQuestionarioWidget extends StatelessWidget {
  const TexfieldNewQuestionarioWidget(
      {Key? key, this.onSaved, required this.label})
      : super(key: key);
  final Function(String?)? onSaved;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          width: 400,
          child: TextFormField(
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'Esse campo não pode ser vazio';
              }
            },
            onSaved: onSaved,
            decoration: const InputDecoration(
              fillColor: Colors.black,
              focusColor: Colors.black,
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
