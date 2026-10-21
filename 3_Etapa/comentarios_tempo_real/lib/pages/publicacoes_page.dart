import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/missao.dart';
import '../services/auth_service.dart';
import '../services/missao_service.dart';
import 'comentarios_page.dart';

class PublicacoesPage extends StatefulWidget {
  const PublicacoesPage({super.key});

  @override
  State<PublicacoesPage> createState() => _PublicacoesPageState();
}

class _PublicacoesPageState extends State<PublicacoesPage> {
  final AuthService _auth = AuthService();
  final MissaoService _missoes = MissaoService();

  late final Stream<List<Missao>> _streamMissoes;

  @override
  void initState() {
    super.initState();
    _streamMissoes = _missoes.listarMissoes();
  }

  Future<void> _sairDaConta() async {
    await _auth.sairDaConta();
  }

  Future<void> _cadastrarMissao() async {
    final controladorTitulo = TextEditingController();
    int grau = 1;

    final confirmado = await showDialog<bool>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, atualizar) {
            return AlertDialog(
              title: const Text('Nova missão'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: controladorTitulo,
                    autofocus: true,
                    decoration: const InputDecoration(
                      labelText: 'Título',
                      hintText: 'Investigar maldição na escola',
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<int>(
                    initialValue: grau,
                    decoration: const InputDecoration(labelText: 'Grau'),
                    items: const [
                      DropdownMenuItem(value: 1, child: Text('1')),
                      DropdownMenuItem(value: 2, child: Text('2')),
                      DropdownMenuItem(value: 3, child: Text('3')),
                      DropdownMenuItem(value: 4, child: Text('4')),
                    ],
                    onChanged: (valor) {
                      atualizar(() => grau = valor ?? 1);
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancelar'),
                ),
                FilledButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Cadastrar'),
                ),
              ],
            );
          },
        );
      },
    );

    if (confirmado != true) return;

    final titulo = controladorTitulo.text.trim();
    if (titulo.isEmpty) return;

    await _missoes.cadastrarMissao(titulo: titulo, grau: grau);
  }

  /// Abre a tela de comentários da publicação selecionada.
  void _abrirComentarios(Missao missao) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => ComentariosPage(missao: missao),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final User? usuario = _auth.usuarioAtual;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comentários'),
        actions: [
          IconButton(
            onPressed: _sairDaConta,
            icon: const Icon(Icons.logout),
            tooltip: 'Sair da conta',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _cadastrarMissao,
        icon: const Icon(Icons.add),
        label: const Text('Missão'),
      ),
      body: Column(
        children: [
          _cabecalho(usuario),
          Expanded(child: _listaDeMissoes(usuario)),
        ],
      ),
    );
  }

  Widget _cabecalho(User? usuario) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: usuario?.photoURL != null
                ? NetworkImage(usuario!.photoURL!)
                : null,
            child: usuario?.photoURL == null
                ? const Icon(Icons.person, size: 32)
                : null,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bem-vindo,\n${usuario?.displayName ?? 'Feiticeiro'}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  usuario?.email ?? '',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _listaDeMissoes(User? usuario) {
    return StreamBuilder<List<Missao>>(
      stream: _streamMissoes,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final missoes = snapshot.data ?? [];

        if (missoes.isEmpty) {
          return const Center(
            child: Text('Nenhuma missão publicada ainda.'),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 88),
          itemCount: missoes.length,
          itemBuilder: (context, indice) {
            final missao = missoes[indice];
            final minhaMissao = missao.usuarioId == usuario?.uid;

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        _iniciais(missao.nomeUsuario),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                    title: Text(
                      missao.titulo,
                      style: TextStyle(
                        decoration: missao.concluida
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    subtitle: Text(
                      '${missao.nomeUsuario.isEmpty ? 'Feiticeiro' : missao.nomeUsuario} '
                      '• Grau ${missao.grau}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.chat_bubble_outline),
                          tooltip: 'Comentários',
                          onPressed: () => _abrirComentarios(missao),
                        ),
                        if (minhaMissao)
                          IconButton(
                            icon: const Icon(Icons.delete_outline),
                            tooltip: 'Excluir missão',
                            onPressed: () => _missoes.excluirMissao(missao.id),
                          ),
                      ],
                    ),
                  ),
                  if (minhaMissao)
                    CheckboxListTile(
                      dense: true,
                      value: missao.concluida,
                      title: const Text('Missão concluída'),
                      onChanged: (_) => _missoes.alternarConcluida(missao),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  String _iniciais(String nome) {
    if (nome.trim().isEmpty) return 'F';

    final partes = nome.trim().split(RegExp(r'\s+'));
    if (partes.length == 1) {
      return partes.first.substring(0, 1).toUpperCase();
    }

    return (partes.first.substring(0, 1) + partes.last.substring(0, 1))
        .toUpperCase();
  }
}
