import 'package:flutter/material.dart';

class ComEstado extends StatefulWidget {
  const ComEstado({super.key});

  @override
  State<ComEstado> createState() => _ComEstadoState();
}

class _ComEstadoState extends State<ComEstado> {
  var nome = 'Cicrano';
  var valor = 130;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
              // style:OutlinedButton ,
              onPressed: () {
                setState(() {
                  nome = 'Fulano';
                  valor = 255;
                });
              },
              child: const Text('Mostre Nome')),
          Opacity(
            opacity: 0.5,
            child: Text(nome),
          ),
          Text(
            nome,
            style: TextStyle(color: Color.fromARGB(valor, 60, 60, 60)),
          )
        ],
      ),
    );
  }
}