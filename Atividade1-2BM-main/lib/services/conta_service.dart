import 'dart:convert';
import 'package:http/http.dart' as http;

class ContaService {
  static const String _url = 'http://localhost:3000/contas';

  static Future<List<dynamic>> getContas() async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erro ao carregar contas');
    }
  }

  static Future<void> criarConta(String nome, double saldo) async {
    final body = json.encode({'nome': nome, 'saldo': saldo});
    final response = await http.post(
      Uri.parse(_url),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    if (response.statusCode != 201) {
      throw Exception('Erro ao criar conta');
    }
  }
}
