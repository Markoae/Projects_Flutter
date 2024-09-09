import 'package:flutter/material.dart';
import 'package:flutter_application_atividades/com_TextField.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Edição de Atividades'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: const ComTextField(),
      ),
    );
  }
}