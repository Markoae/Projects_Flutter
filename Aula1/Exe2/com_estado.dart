import 'package:flutter/material.dart';

class ComEstado extends StatefulWidget {
  const ComEstado({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ComEstadoState createState() => _ComEstadoState();
}

class _ComEstadoState extends State<ComEstado> {
  int currentNumber = 1;

  void incrementEven() {
    setState(() {
      if (currentNumber % 2 == 0) {
        currentNumber += 2;
      } else {
        currentNumber += 1;
      }
    });
  }

  void incrementOdd() {
    setState(() {
      if (currentNumber % 2 == 0) {
        currentNumber += 1;
      } else {
        currentNumber += 2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Par ou Ímpar',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'O número atual é: $currentNumber',
                style: const TextStyle(fontSize: 28),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: incrementEven,
                    child: const Text('Par'),
                  ),
                  ElevatedButton(
                    onPressed: incrementOdd,
                    child: const Text('Ímpar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}