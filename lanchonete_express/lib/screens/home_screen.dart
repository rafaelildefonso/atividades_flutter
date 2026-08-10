import 'package:flutter/material.dart';
import 'package:lanchonete_express/models/produto.dart';
import 'package:lanchonete_express/widgets/card_produto.dart';

class TelaInicial extends StatelessWidget {
  TelaInicial({super.key});

  final List<Produto> produtos = [
    Produto(
      nome: 'X-Burguer',
      preco: 'R\$ 18,00',
      descricao: 'Pão, carne, queijo e molho especial.',
    ),
    Produto(
      nome: 'Batata Frita',
      preco: 'R\$ 12,00',
      descricao: 'Porção individual crocante.',
    ),
    Produto(
      nome: 'Suco Natural',
      preco: 'R\$ 8,00',
      descricao: 'Suco gelado da fruta.',
    ),
    Produto(
      nome: 'Combo Especial',
      preco: 'R\$ 28,00',
      descricao: 'X-Burguer, batata e suco.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lanchonete Express')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Bem-vindo à Lanchonete Express!'),
            const SizedBox(height: 16),
            ...produtos.map(
              (p) => CardProduto(
                nome: p.nome,
                preco: p.preco,
                descricao: p.descricao,
                aoClicar: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
