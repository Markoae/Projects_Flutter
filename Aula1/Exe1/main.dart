import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Cartão de Visitas',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Meu Cartão',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Marco Aurelio Estevam',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text('Professor de Desenvolvimento de Sistemas, Desenvolvedor'),
              Text('Novotec SP | Harena Inovação'),
              Text('aurelio.estevam@gmail.com'),
            ],
          ),
        ),
      ),
    );
  }
}