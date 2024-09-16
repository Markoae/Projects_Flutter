import 'package:flutter/material.dart';
import 'package:flutter_operacoes_matematicas/divisao.dart';
import 'package:flutter_operacoes_matematicas/multiplicacao.dart';
import 'package:flutter_operacoes_matematicas/soma.dart';
import 'package:flutter_operacoes_matematicas/subtracao.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Widget atual = const Soma();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                title: const Text('Soma'),
                onTap: () {
                  setState(() {
                    atual = const Soma();
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Subtração'),
                onTap: () {
                  setState(() {
                    atual = const Subtracao();
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Multiplicação'),
                onTap: () {
                  setState(() {
                    atual = const Multiplicacao();
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Divisão'),
                onTap: () {
                  setState(() {
                    atual = const Divisao();
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Matemática'),
        ),
        body: atual,
      ),
    );
  }
}