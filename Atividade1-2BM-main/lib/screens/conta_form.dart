import 'package:flutter/material.dart';
import '../services/conta_service.dart'; // Importa o serviço para criar contas.

class TelaFormularioConta extends StatefulWidget {
  @override
  _TelaFormularioContaState createState() => _TelaFormularioContaState();
}

class _TelaFormularioContaState extends State<TelaFormularioConta> {
  final _formKey = GlobalKey<FormState>();
  String nome = '';
  double saldo = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Conta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                onChanged: (value) {
                  nome = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Saldo'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  saldo = double.parse(value);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await ContaService.criarConta(nome, saldo);
                    Navigator.pop(context, true); // Retorna para a tela anterior.
                  }
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
