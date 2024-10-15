import 'package:flutter/material.dart';
import '../services/conta_service.dart'; // Importa o serviço para carregar as contas.
import 'conta_form.dart'; // Importa a tela do formulário.

class TelaListaContas extends StatefulWidget {
  @override
  _TelaListaContasState createState() => _TelaListaContasState();
}

class _TelaListaContasState extends State<TelaListaContas> {
  List<dynamic> contas = [];

  @override
  void initState() {
    super.initState();
    carregarContas(); // Carrega as contas quando a tela é iniciada.
  }

  Future<void> carregarContas() async {
    final dados = await ContaService.getContas();
    setState(() {
      contas = dados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contas'),
      ),
      body: ListView.builder(
        itemCount: contas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contas[index]['nome']),
            subtitle: Text('Saldo: R\$ ${contas[index]['saldo']}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final resultado = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TelaFormularioConta()),
          );
          if (resultado == true) {
            carregarContas(); // Atualiza a lista ao retornar do formulário.
          }
        },
      ),
    );
  }
}
