import 'package:flutter/material.dart';

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
          backgroundColor: Colors.lightGreen,
          centerTitle: true,
          title: const Text('Atividades'),
        ),
        body: const Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Estudar para a prova de Matemática',
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 26,
                      color: Colors.blue),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '16/08/2024',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 22,
                          color: Colors.blue),
                    ),
                  ),
                ),
              ], // children
            ),
            Row(
              children: [
                Icon(Icons.check_box),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Campeonato de futebol.',
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 26,
                      color: Colors.black),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '14/08/2024',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.schedule, color: Colors.green),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Festa da Joana.',
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 26,
                      color: Colors.green),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '23/08/2024',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 22,
                          color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.disabled_by_default, color: Colors.red),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Festa do Leandro.',
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontFamily: 'Quicksand',
                      fontSize: 26,
                      color: Colors.red),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '17/08/2024',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 22,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}