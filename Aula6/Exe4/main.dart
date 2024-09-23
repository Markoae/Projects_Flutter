import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_http/endereco.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _ruaController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();
  var conteudo = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Text(
                'Sistema Busca CEP',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _cepController,
                decoration: const InputDecoration(labelText: 'Digite o CEP'),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('Resultado: $conteudo'),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _ruaController,
                decoration: const InputDecoration(labelText: 'Rua:'),
              ),
              TextField(
                controller: _bairroController,
                decoration: const InputDecoration(labelText: 'Bairro:'),
              ),
              TextField(
                controller: _cidadeController,
                decoration: const InputDecoration(labelText: 'Cidade:'),
              ),
              TextField(
                controller: _estadoController,
                decoration: const InputDecoration(labelText: 'Estado:'),
              ),
              TextButton(
                onPressed: buscaCEP,
                child: const Text('Buscar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void buscaCEP() async {
    String cep = _cepController.text;
    String url = 'https://viacep.com.br/ws/$cep/json/';

    final resposta = await http.get(Uri.parse(url));
    if (resposta.body.length <= 21) {
      setState(() {
        _ruaController.clear();
        _bairroController.clear();
        _cidadeController.clear();
        _estadoController.clear();
      });
    } else if (resposta.statusCode == 200) {
      // resposta 200 OK
      // o body contém JSON
      final jsonDecodificado = jsonDecode(resposta.body);
      final endereco = Endereco.fromJson(jsonDecodificado);
      setState(() {
        conteudo = endereco.logradouro;
        _ruaController.text = endereco.logradouro;
        _bairroController.text = endereco.bairro;
        _cidadeController.text = endereco.cidade;
        _estadoController.text = endereco.estado;
      });
    } else {
      // diferente de 200
      throw Exception('Falha no carregamento.');
    }
  }
}