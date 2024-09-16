import 'package:flutter/material.dart';
import 'package:flutter_operacoes_matematicas/multiplicacao.dart';
import 'package:flutter_operacoes_matematicas/soma.dart';
import 'package:flutter_operacoes_matematicas/subtracao.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: '+ Soma +',
                  //icon: Icon(Icons.directions_car),
                ),
                Tab(
                  text: '- Subtração -',
                  //icon: Icon(Icons.directions_transit),
                ),
                Tab(
                  text: 'x Multiplicação x ',
                  //icon: Icon(Icons.directions_transit),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Soma(),
              Subtracao(),
              Multiplicacao(),
            ],
          ),
        ),
      ),
    );
  }
}