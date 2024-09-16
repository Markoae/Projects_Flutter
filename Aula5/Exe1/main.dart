import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Recebendo número:'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int numero = 0;
  // criação do controlador
  TextEditingController controlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                // Ajuste do controlador
                controller: controlador,
              ),
            ),
            Text(
              // Exibindo valor do controlador:
              'Resultado: $numero',
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Usando valor do controlador
                  numero = int.parse(controlador.text);
                });
              },
              child: const Text('Verificar'),
            ),
          ],
        ),
      ),
    );
  }
}