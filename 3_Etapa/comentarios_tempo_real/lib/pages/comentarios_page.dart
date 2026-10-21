import 'package:flutter/material.dart';

import '../models/comentario.dart';
import '../models/missao.dart';
import '../services/auth_service.dart';
import '../services/comentario_service.dart';

class ComentariosPage extends StatefulWidget {
  final Missao missao;

  const ComentariosPage({super.key, required this.missao});

  @override
  State<ComentariosPage> createState() => _ComentariosPageState();
}

class _ComentariosPageState extends State<ComentariosPage> {
  final ComentarioService _comentarios = ComentarioService();
  final AuthService _auth = AuthService();
  final TextEditingController _controlador = TextEditingController();

  late final Stream<List<Comentario>> _streamComentarios;

  bool _enviando = false;

  @override
  void initState() {
    super.initState();
    _streamComentarios = _comentarios.listarComentarios(widget.missao.id);
  }

  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  Future<void> _enviarComentario() async {
    final texto = _controlador.text.trim();
    if (texto.isEmpty) return;

    setState(() => _enviando = true);

    try {
      await _comentarios.comentar(missaoId: widget.missao.id, texto: texto);
      _controlador.clear();
      if (!mounted) return;
      FocusScope.of(context).unfocus();
    } catch (erro) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao comentar: $erro')),
        );
      }
    } finally {
      if (mounted) setState(() => _enviando = false);
    }
  }

  Future<void> _excluirComentario(Comentario comentario) async {
    try {
      await _comentarios.excluirComentario(comentario.id);
    } catch (erro) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao excluir: $erro')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final uidAtual = _auth.usuarioAtual?.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comentários'),
      ),
      body: Column(
        children: [
          _publicacao(),
          const Divider(height: 1),
          Expanded(child: _listaDeComentarios(uidAtual)),
          _campoDeEnvio(),
        ],
      ),
    );
  }

  /// Publicação que está sendo discutida.
  Widget _publicacao() {
    final missao = widget.missao;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            missao.titulo,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            '${missao.nomeUsuario.isEmpty ? 'Feiticeiro' : missao.nomeUsuario} '
            '• Grau ${missao.grau}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  /// Comentários da publicação em tempo real.
  Widget _listaDeComentarios(String? uidAtual) {
    return StreamBuilder<List<Comentario>>(
      stream: _streamComentarios,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final comentarios = snapshot.data ?? [];

        if (comentarios.isEmpty) {
          return const Center(
            child: Text('Nenhum comentário ainda. Seja o primeiro!'),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: comentarios.length,
          itemBuilder: (context, indice) {
            final comentario = comentarios[indice];
            final meuComentario = comentario.usuarioId == uidAtual;

            return ListTile(
              leading: CircleAvatar(
                child: Text(
                  _iniciais(comentario.nomeUsuario),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              title: Text(comentario.texto),
              subtitle: Text(comentario.nomeUsuario),
              trailing: meuComentario
                  ? IconButton(
                      icon: const Icon(Icons.delete_outline),
                      tooltip: 'Excluir comentário',
                      onPressed: () => _excluirComentario(comentario),
                    )
                  : null,
            );
          },
        );
      },
    );
  }

  /// Campo de escrita do comentário.
  Widget _campoDeEnvio() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controlador,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => _enviarComentario(),
                decoration: const InputDecoration(
                  hintText: 'Escreva um comentário...',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton.filled(
              onPressed: _enviando ? null : _enviarComentario,
              icon: _enviando
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.send),
              tooltip: 'Enviar comentário',
            ),
          ],
        ),
      ),
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
