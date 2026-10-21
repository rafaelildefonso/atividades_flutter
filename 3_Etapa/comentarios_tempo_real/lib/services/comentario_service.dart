import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/comentario.dart';

class ComentarioService {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  final String colecao = 'comentarios';

  String get _usuarioId => FirebaseAuth.instance.currentUser!.uid;

  String get _nomeUsuario =>
      FirebaseAuth.instance.currentUser?.displayName ?? 'Feiticeiro';

  /// Comentários de uma única publicação, em tempo real.
  ///
  /// O filtro por `missaoId` garante que um comentário de uma publicação
  /// nunca apareça na discussão de outra.
  Stream<List<Comentario>> listarComentarios(String missaoId) {
    return _firebase
        .collection(colecao)
        .where('missaoId', isEqualTo: missaoId)
        .snapshots()
        .map((snapshot) {
          final comentarios = snapshot.docs
              .map((documento) => Comentario.fromMap(documento.id, documento.data()))
              .toList();
          comentarios.sort((a, b) => _compararData(a.dataCriacao, b.dataCriacao));
          return comentarios;
        });
  }

  Future<void> comentar({
    required String missaoId,
    required String texto,
  }) async {
    final comentario = Comentario(
      id: '',
      texto: texto,
      nomeUsuario: _nomeUsuario,
      usuarioId: _usuarioId,
      missaoId: missaoId,
    );

    await _firebase.collection(colecao).add({
      ...comentario.toMap(),
      'dataCriacao': FieldValue.serverTimestamp(),
    });
  }

  Future<void> excluirComentario(String id) async {
    await _firebase.collection(colecao).doc(id).delete();
  }

  /// Ordena da data mais antiga para a mais recente.
  int _compararData(Timestamp? a, Timestamp? b) {
    if (a == null && b == null) return 0;
    if (a == null) return -1;
    if (b == null) return 1;
    return a.compareTo(b);
  }
}
