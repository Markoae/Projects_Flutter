import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

class Segunda extends StatefulWidget {
  const Segunda({super.key});

  @override
  State<Segunda> createState() => _SegundaState();
}

class _SegundaState extends State<Segunda> {
  TextEditingController controlaNome = TextEditingController();
  TextEditingController controlaSobrenome = TextEditingController();
  TextEditingController controlaData = TextEditingController();
  TextEditingController controlaSenha = TextEditingController();

  // Conjunto de Regras para a Data
  final RegExp dataRegExp =
      RegExp(r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/([0-9]{4})$');
  String dataErrorMessage = '';

  late FocusNode focoNome;
  String ajudaData = 'Exemplo: 01/01/1970';

  @override
  void initState() {
    super.initState();
    focoNome = FocusNode();
    //controlaData.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
  }

// Verificação da Senha
  // Variáveis para indicar o estado das regras
  bool temMinimo8Caracteres = false;
  bool temLetraMaiuscula = false;
  bool tem3Numeros = false;
  bool tem2CaracteresEspeciais = false;

// Conjunto de Regras para a Senha
  final RegExp caractereEspecial = RegExp(r'[!@#$%^&*()?_\-+=]');
  final RegExp numeros = RegExp(r'[0-9]');
  final RegExp letraMaiuscula = RegExp(r'[A-Z]');
  String passwordErrorMessage = '';

// **********************************************************************************
//                              Função de Validar Senha
// **********************************************************************************
  void validarSenha(String senha) {
    setState(() {
      // Verificações individuais
      temMinimo8Caracteres = senha.length >= 8;
      temLetraMaiuscula = letraMaiuscula.hasMatch(senha);
      tem3Numeros =
          senha.split('').where((c) => numeros.hasMatch(c)).length >= 3;
      tem2CaracteresEspeciais =
          senha.split('').where((c) => caractereEspecial.hasMatch(c)).length >=
              2;

      // Monta a mensagem de erro se as regras não forem atendidas
      List<String> erros = [];
      if (!temMinimo8Caracteres) erros.add('Mínimo 8 caracteres');
      if (!temLetraMaiuscula) erros.add('Deve ter uma letra maiúscula');
      if (!tem3Numeros) erros.add('Deve conter 3 números');
      if (!tem2CaracteresEspeciais) {
        erros.add('Deve ter 2 caracteres especiais');
      }
      // Junta os erros em uma única string
      passwordErrorMessage = erros.isEmpty ? '' : erros.join(', ');
    });
  }
// **********************************************************************************

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focoNome.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                focusNode: focoNome,
                controller: controlaNome,
                autofocus: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Nome:'),
              ),
              const SizedBox(
                height: 50.0,
              ),
              TextField(
                controller: controlaSobrenome,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Sobrenome:'),
              ),
              const SizedBox(
                height: 50.0,
              ),
              TextFormField(
                controller: controlaData,
                decoration: InputDecoration(
                  helperText: ajudaData,
                  border: const OutlineInputBorder(),
                  labelText: 'Data de Nascimento:',
                  errorText:
                      dataErrorMessage.isNotEmpty ? dataErrorMessage : null,
                ),
                onChanged: (value) {
                  setState(() {
                    setState(() {
                      dataErrorMessage =
                          dataRegExp.hasMatch(value) ? '' : 'Data inválida';
                    });
                  });
                },
              ),
              const SizedBox(
                height: 50.0,
              ),
              TextField(
                controller: controlaSenha,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Senha:',
                  errorText: passwordErrorMessage.isNotEmpty
                      ? passwordErrorMessage
                      : null,
                ),
                onChanged: validarSenha,
              ),
              const SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        controlaNome.clear();
                        controlaSobrenome.clear();
                        controlaData.clear();
                        controlaSenha.clear();
                        focoNome.requestFocus();
                        dataErrorMessage = '';
                        passwordErrorMessage = '';
                      },
                      child: const Text('Limpar')),
                  const SizedBox(
                    width: 30,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        focoNome.requestFocus();
                      },
                      child: const Text('Enviar')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}