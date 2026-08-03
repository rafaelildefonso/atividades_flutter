// TODO: Tela de detalhes do produto (StatefulWidget)
// Deve conter:
//   1. Nome do produto (recebido por parâmetro via objeto Produto)
//   2. Preço
//   3. Descrição
//   4. Botão para voltar (Navigator.pop)
//   5. Botão "Adicionar destaque" que muda algo visual com setState
//      Ex: mostrar uma mensagem "Produto mais pedido da semana!"
//   6. Um AnimatedContainer que muda de tamanho, cor, borda ou
//      arredondamento ao clicar no botão
//   7. Widget deve receber um objeto Produto como parâmetro

import 'package:flutter/material.dart';
import 'package:lanchonete_express/models/produto.dart';

class DetailScreen extends StatefulWidget {
  final Produto produto;

  const DetailScreen({super.key, required this.produto});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.produto.nome)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.produto.nome),
            Text(widget.produto.preco),
            Text(widget.produto.descricao),
          ],
        ),
      ),
    );
  }
}
