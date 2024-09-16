import 'package:flutter/material.dart';
import 'package:flutter_imc/imc.dart';

void main() {
  runApp(const CalculadoraIMC());
}

class CalculadoraIMC extends StatelessWidget {
  const CalculadoraIMC({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Imc(),
    );
  }
}