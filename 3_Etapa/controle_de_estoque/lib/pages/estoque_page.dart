import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/produto_provider.dart';

class EstoquePage extends StatefulWidget {
  const EstoquePage({super.key});

  @override
  State<EstoquePage> createState() => _EstoquePageState();
}

class _EstoquePageState extends State<EstoquePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProdutoProvider>().carregarProdutos();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProdutoProvider>();
    final produtos = provider.produtos;

    return Scaffold(
      appBar: AppBar(title: const Text('ESTOQUE')),
      body: produtos.isEmpty
          ? const Center(child: Text('Nenhum produto cadastrado.'))
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                final produto = produtos[index];
                final estoqueBaixo = produto.quantidade <= 3;

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          produto.nome,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(produto.categoria),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                provider.decrementarQuantidade(produto);
                              },
                              icon: const Icon(Icons.remove_circle),
                            ),
                            Text('Quantidade: ${produto.quantidade}'),
                            IconButton(
                              onPressed: () {
                                provider.incrementarQuantidade(produto);
                              },
                              icon: const Icon(Icons.add_circle),
                            ),
                          ],
                        ),
                        Text('R\$ ${produto.preco.toStringAsFixed(2)}'),
                        if (estoqueBaixo)
                          const Text(
                            'ESTOQUE BAIXO',
                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              provider.excluirProduto(produto);
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                            child: const Text('EXCLUIR'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
