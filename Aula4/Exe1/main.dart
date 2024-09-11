import 'package:flutter/material.dart';
import 'package:projeto/segunda.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Primeira(),
    );
  }
}

class Primeira extends StatelessWidget {
  const Primeira({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Segunda()),);
          },
          icon: const Icon(Icons.edit),
        ),
      ),
    );
  }
}