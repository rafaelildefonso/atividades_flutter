import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/missao.dart';

class MissaoService {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  final String colecao = 'missoes';

  String get _usuarioId => FirebaseAuth.instance.currentUser!.uid;

  String get _nomeUsuario =>
      FirebaseAuth.instance.currentUser?.displayName ?? 'Feiticeiro';

  /// Publicações (missões) de todos os usuários, em tempo real.
  ///
  /// As publicações mais recentes aparecem primeiro.
  Stream<List<Missao>> listarMissoes() {
    return _firebase.collection(colecao).snapshots().map((snapshot) {
      final missoes = snapshot.docs
          .map((documento) => Missao.fromMap(documento.id, documento.data()))
          .toList();
      missoes.sort((a, b) => _compararData(a.dataCriacao, b.dataCriacao));
      return missoes;
    });
  }

  Future<void> cadastrarMissao({
    required String titulo,
    required int grau,
  }) async {
    final missao = Missao(
      id: '',
      titulo: titulo,
      grau: grau,
      concluida: false,
      usuarioId: _usuarioId,
      nomeUsuario: _nomeUsuario,
    );

    await _firebase.collection(colecao).add({
      ...missao.toMap(),
      'dataCriacao': FieldValue.serverTimestamp(),
    });
  }

  Future<void> alternarConcluida(Missao missao) async {
    await _firebase.collection(colecao).doc(missao.id).update({
      'concluida': !missao.concluida,
    });
  }

  Future<void> excluirMissao(String id) async {
    await _firebase.collection(colecao).doc(id).delete();
  }

  /// Ordena da data mais recente para a mais antiga.
  int _compararData(Timestamp? a, Timestamp? b) {
    if (a == null && b == null) return 0;
    if (a == null) return 1;
    if (b == null) return -1;
    return b.compareTo(a);
  }
}
