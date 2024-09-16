import 'package:flutter/material.dart';

class Imc extends StatefulWidget {
  const Imc({super.key});

  @override
  State<Imc> createState() => _ImcState();
}

class _ImcState extends State<Imc> {
  final TextEditingController alturaController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  String _resultado = '';

  void _calcularIMC() {
    double? altura = double.tryParse(alturaController.text);
    double? peso = double.tryParse(pesoController.text);

    if (altura != null && peso != null && altura > 0) {
      double imc = peso / (altura * altura);
      setState(() {
        _resultado = 'Seu IMC é ${imc.toStringAsFixed(2)}';
      });
    } else {
      setState(() {
        _resultado = 'Preencha os campos corretamente';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Altura (em metros)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Peso (em kg)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calcularIMC,
              child: const Text('Calcular IMC'),
            ),
            const SizedBox(height: 16),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}