import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/usuario_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UsuarioProvider>();
    final nome = provider.usuarioLogado?.nome ?? 'Usuário';

    return Scaffold(
      appBar: AppBar(title: const Text('CONTROLE DE ESTOQUE')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Olá, $nome!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Text(
              'CONTROLE DE ESTOQUE',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/estoque');
                },
                child: const Text('VER PRODUTOS'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cadastro_produto');
                },
                child: const Text('CADASTRAR PRODUTO'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.read<UsuarioProvider>().logout();
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text('SAIR'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
