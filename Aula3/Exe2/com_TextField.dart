import 'package:flutter/material.dart';

class ComTextField extends StatefulWidget {
  const ComTextField({super.key});

  @override
  State<ComTextField> createState() => _ComTextFieldState();
}

class _ComTextFieldState extends State<ComTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Nome: '),
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Nome:'),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.centerRight,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Data: '),
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Data: '),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        FilledButton(
            onPressed: () {
              // Função vazia
            },
            child: const Text('Salvar')),
      ],
    );
  }
}