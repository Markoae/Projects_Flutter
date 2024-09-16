import 'package:flutter/material.dart';

class Calculo extends StatefulWidget {
  const Calculo({super.key});

  @override
  State<Calculo> createState() => _CalculoState();
}

class _CalculoState extends State<Calculo> {
  String _visor = '';

  void _adicionarTexto(String texto) {
    setState(() {
      if (texto == 'C') {
        _visor = '';
      } else if (texto == 'DEL') {
        _visor =
            _visor.isNotEmpty ? _visor.substring(0, _visor.length - 1) : '';
      } else if (texto == '=') {
        //try {
        var resultado = _avaliarExpressao(_visor);
        _visor = resultado.toString();
        // } catch (e) {
        //    _visor = 'Erro';
        //   }
      } else {
        _visor += texto;
      }
    });
  }

  double _avaliarExpressao(String expressao) {
    // Remove espaços
    final cleanedExpression = expressao.replaceAll(' ', '');

    // Adiciona um prefixo de "0" para lidar com expressões que começam com um operador
    final expressionWithPrefix = '0+$cleanedExpression';

    // Cria uma lista de operadores e números
    final operadores = RegExp(r'[+\-*/]');
    final numeros = expressionWithPrefix.split(operadores);

    // Cria uma lista de operadores encontrada na expressão
    final listaOperadores = operadores
        .allMatches(expressionWithPrefix)
        .map((m) => m.group(0))
        .toList();

    // Calcula a expressão com base nos operadores e números
    double resultado = double.parse(numeros[0]);

    for (int i = 0; i < listaOperadores.length; i++) {
      final operador = listaOperadores[i];
      final num2 = double.parse(numeros[i + 1]);

      switch (operador) {
        case '+':
          resultado += num2;
          break;
        case '-':
          resultado -= num2;
          break;
        case '*':
          resultado *= num2;
          break;
        case '/':
          resultado /= num2;
          break;
      }
    }
    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    _visor,
                    style: const TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                _criarBotao('7'),
                _criarBotao('8'),
                _criarBotao('9'),
                _criarBotao('/'),
              ],
            ),
            Row(
              children: [
                _criarBotao('4'),
                _criarBotao('5'),
                _criarBotao('6'),
                _criarBotao('*'),
              ],
            ),
            Row(
              children: [
                _criarBotao('1'),
                _criarBotao('2'),
                _criarBotao('3'),
                _criarBotao('-'),
              ],
            ),
            Row(
              children: [
                _criarBotao('0'),
                _criarBotao('.'),
                _criarBotao('DEL'),
                _criarBotao('+'),
              ],
            ),
            Row(
              children: [
                _criarBotao('C'),
                _criarBotao('='),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _criarBotao(String texto) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => _adicionarTexto(texto),
          child: Text(
            texto,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}