
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_geo/current.dart';
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
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();

  var textUmidade = '';
  var textTemperatura = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Text(
                'Sistema Busca Geolocalização',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: latitudeController,
                decoration:
                    const InputDecoration(labelText: 'Digite a Latitude'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: longitudeController,
                decoration:
                    const InputDecoration(labelText: 'Digite a Longitude'),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('Temperatura: $textTemperatura'),
              Text('Umidade Relativa: $textUmidade'),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: buscaGEO,
                child: const Text('Buscar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void buscaGEO() async {
    String latitude = latitudeController.text;
    String longitude = longitudeController.text;
    String url =
        'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=temperature_2m,relative_humidity_2m&forecast_days=1';

    final resposta = await http.get(Uri.parse(url));
    if (resposta.body.length <= 21) {
      setState(() {
        latitudeController.clear();
        longitudeController.clear();
      });
    } else if (resposta.statusCode == 200) {
      // resposta 200 OK
      // o body contém JSON
      final jsonDecodificado = jsonDecode(resposta.body);
      final jsonTempoAtual = jsonDecodificado['current'];
      final valores = Current.fromJson(jsonTempoAtual);
      setState(() {
        textTemperatura = valores.temperatura.toString();
        textUmidade = valores.umidadeRelativa.toString();
      });
    } else {
      // diferente de 200
      throw Exception('Falha no carregamento.');
    }
  }
}
