import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_dolar/dolar.dart';
import 'package:flutter_application_dolar/historico.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String dolarHoje = '';
  final TextEditingController historicoController = TextEditingController();
  final TextEditingController dataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Text(
                'Sistema Cotação do Dólar',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Cotação do Dolar Hoje:'),
              Text(dolarHoje),
              TextButton(
                onPressed: buscaDolarHoje,
                child: const Text('Cotação Dolar'),
              ),
              TextButton(
                onPressed: buscaHistorico,
                child: const Text('Histórico do Dolar'),
              ),
              TextField(
                controller: dataController,
                decoration: const InputDecoration(
                  labelText: 'Data Inicial da Consulta dd/mm/aaaa',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
              TextField(
                maxLines: 16,
                controller: historicoController,
                decoration: const InputDecoration(
                  hintText: 'Histórico Cotação do Dolar',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void buscaDolarHoje() async {
    String url = 'https://economia.awesomeapi.com.br/last/USD-BRL';
    final resposta = await http.get(Uri.parse(url));

    final jsonDecodificado = jsonDecode(resposta.body);
    final jsonDolarAtual = jsonDecodificado['USDBRL'];
    final valores = Dolar.fromJson(jsonDolarAtual);

    if (resposta.body.length <= 21) {
      setState(() {
        dolarHoje = 'Não Encontrado';
      });
    } else if (resposta.statusCode == 200) {
      // se resposta 200 OK , o body contém JSON
      setState(() {
        dolarHoje =
            'Dolar High: ${valores.dolarHigh}, Dolar Low: ${valores.dolarLow}';
      });
    } else {
      // diferente de 200
      throw Exception('Falha no carregamento.');
    }
  }

  void buscaHistorico() async {
    DateTime dataAtual = DateTime.now();
    String dataHoje = "${dataAtual.day}/${dataAtual.month}/${dataAtual.year}";

    String dataConsulta = dataController.text;

    // Formato para converter a string em DateTime
    DateFormat formato = DateFormat('dd/MM/yyyy');
    // Converter as strings para objetos DateTime
    DateTime dataInicial = formato.parse(dataConsulta);
    DateTime dataFinal = formato.parse(dataHoje);
    Duration diferenca = dataFinal.difference(dataInicial);

    String url2 =
        'https://economia.awesomeapi.com.br/json/daily/USD-BRL/${diferenca.inDays}';

    final resposta2 = await http.get(Uri.parse(url2));

    if (resposta2.body.length <= 21) {
      setState(() {
        historicoController.text = 'Dados não Encontrados';
      });
    } else if (resposta2.statusCode == 200) {
      //se resposta 200 OK , o body contém JSON
      final List<dynamic> jsonDecodificado2 = jsonDecode(resposta2.body);

      List<Historico> valores2 =
          jsonDecodificado2.map((item) => Historico.fromJson(item)).toList();
      setState(() {
        historicoController.text = valores2
            .map((cotacao) =>
                'Dolar High: ${cotacao.hDolarHigh}, Dolar Low: ${cotacao.hDolarLow}')
            .join('\n');
      });
    } else {
      //diferente de 200
      throw Exception('Falha no carregamento.');
    }
  }
}