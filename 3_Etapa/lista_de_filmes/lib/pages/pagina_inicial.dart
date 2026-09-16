import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/filme_viewmodel.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FilmeViewModel>(context, listen: false).carregarFilmes();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _adicionarFilme() {
    Provider.of<FilmeViewModel>(context, listen: false)
        .adicionarFilme(_controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Lista de Filmes'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Digite o nome do filme',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _adicionarFilme(),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _adicionarFilme,
              child: const Text('Adicionar'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Consumer<FilmeViewModel>(
                builder: (context, viewModel, child) {
                  if (viewModel.filmes.isEmpty) {
                    return const Center(
                      child: Text('Nenhum filme cadastrado.'),
                    );
                  }
                  return ListView.builder(
                    itemCount: viewModel.filmes.length,
                    itemBuilder: (context, index) {
                      final filme = viewModel.filmes[index];
                      return ListTile(
                        leading: Text('${filme.id}'),
                        title: Text(
                          filme.titulo,
                          style: TextStyle(
                            decoration: filme.assistido
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        trailing: Checkbox(
                          value: filme.assistido,
                          onChanged: (value) {
                            viewModel.alternarAssistido(
                                filme.id!, value ?? false);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
