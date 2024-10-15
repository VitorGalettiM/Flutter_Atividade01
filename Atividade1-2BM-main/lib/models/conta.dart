class Conta {
  final String nome;
  final double saldo;

  Conta({required this.nome, required this.saldo});

  factory Conta.fromJson(Map<String, dynamic> json) {
    return Conta(
      nome: json['nome'],
      saldo: json['saldo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'saldo': saldo,
    };
  }
}
