import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/tempo.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );
  final TextEditingController _latitude = TextEditingController();
  final TextEditingController _longitude = TextEditingController();
  var conteudo = '';
  var umidade = '';
  late Position posicao;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              TextField(
                controller: _latitude,
                decoration: const InputDecoration(labelText: 'Latitude'),
              ),
              TextField(
                controller: _longitude,
                decoration: const InputDecoration(labelText: 'Longitude'),
              ),
              Text(
                'Temperatura atual: $conteudoºC',
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
              Text(
                'Umidade atual: $umidade',
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
              TextButton(
                onPressed: buscaTempo,
                child: const Text('Buscar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void buscaTempo() async {
    // Position position = await Geolocator.getCurrentPosition(
    //   desiredAccuracy: LocationAccuracy.best,
    //   timeLimit: Duration(seconds: 100),
    //   forceAndroidLocationManager: false,
    // );
    Position position = await _determinePosition();
    print(position);
    String lat = '${position.latitude}';
    //String lat = _latitude.text;
    String lon = '${position.longitude}';
    //String lon = _longitude.text;

    String url =
        'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m,relative_humidity_2m&forecast_days=1';

    final resposta = await http.get(Uri.parse(url));

    if (resposta.statusCode == 200) {
      // resposta 200 OK
      // o body contém JSON
      final jsonDecodificado = jsonDecode(resposta.body);
      final jsonTempoAtual = jsonDecodificado['current'];
      final tempo = Tempo.fromJson(jsonTempoAtual);

      setState(() {
        conteudo = '${tempo.temperature2m}';
        umidade = '${tempo.humidity2m}';
      });
    } else {
      // diferente de 200
      throw Exception('Falha no carregamento.');
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}