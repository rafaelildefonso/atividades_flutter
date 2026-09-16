// TODO: Widget personalizado CardProduto
// Deve receber por parâmetro:
//   - String nome
//   - String preco
//   - String descricao
//   - VoidCallback aoClicar
//
// Estrutura sugerida:
// class CardProduto extends StatelessWidget {
//   final String nome;
//   final String preco;
//   final String descricao;
//   final VoidCallback aoClicar;
//
//   const CardProduto({
//     super.key,
//     required this.nome,
//     required this.preco,
//     required this.descricao,
//     required this.aoClicar,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     // Retornar um Card ou Container com:
//     //   - Nome do produto (Text)
//     //   - Preço (Text)
//     //   - Descrição curta (Text)
//     //   - Botão "Ver detalhes" que chama aoClicar
//   }
// }
import 'package:flutter/material.dart';

class CardProduto extends StatelessWidget {
  final String nome;
  final String preco;
  final String descricao;
  final VoidCallback aoClicar;
  const CardProduto(
      {super.key,
      required this.nome,
      required this.preco,
      required this.descricao,
      required this.aoClicar});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(nome),
          Text(preco),
          Text(descricao),
          ElevatedButton(onPressed: aoClicar, child: Text("Ver detalhes"))
        ],
      ),
    );
  }
}
