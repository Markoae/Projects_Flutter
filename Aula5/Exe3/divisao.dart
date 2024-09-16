import 'package:flutter/material.dart';

class Divisao extends StatefulWidget {
  const Divisao({super.key});

  @override
  State<Divisao> createState() => _DivisaoState();
}

class _DivisaoState extends State<Divisao> {
  double resultado = 0;

  TextEditingController controlaX = TextEditingController();
  TextEditingController controlaY = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: controlaX,
            decoration: const InputDecoration(labelText: 'X:'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: controlaY,
            decoration: const InputDecoration(labelText: 'Y:'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                resultado =
                    double.parse(controlaX.text) / double.parse(controlaY.text);
              });
            },
            child: const Text('Somar'),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Resultado: $resultado',
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ],
      ),
    );
  }
}