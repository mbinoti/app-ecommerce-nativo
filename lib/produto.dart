import 'dart:convert';

class Produto {
  String nome;
  double preco;
  int quantidade;
  String imagem;

  Produto({
    required this.nome,
    required this.preco,
    required this.quantidade,
    required this.imagem,
  });

  // Converter um Produto em um Map (usado para serialização em JSON)
  Map<String, dynamic> toJson() => {
        'nome': nome,
        'preco': preco,
        'quantidade': quantidade,
        'imagem': imagem,
      };

  // Converter um Map em um Produto (usado para desserialização do JSON)
  factory Produto.fromJson(Map<String, dynamic> json) => Produto(
        nome: json['nome'],
        preco: json['preco'].toDouble(),
        quantidade: json['quantidade'],
        imagem: json['imagem'],
      );
}
