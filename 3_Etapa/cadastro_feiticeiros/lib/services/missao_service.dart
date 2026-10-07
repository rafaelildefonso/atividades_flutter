import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/missao.dart';

class MissaoService {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  final String colecao = 'missoes';

  String get _usuarioId => FirebaseAuth.instance.currentUser!.uid;

  Stream<List<Missao>> listarMissoes() {
    return _firebase
        .collection(colecao)
        .where('usuarioId', isEqualTo: _usuarioId)
        .snapshots()
        .map((snapshot) {
          final missoes = snapshot.docs
              .map((documento) => Missao.fromMap(documento.id, documento.data()))
              .toList();
          missoes.sort((a, b) => a.grau.compareTo(b.grau));
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
    );

    await _firebase.collection(colecao).add(missao.toMap());
  }

  Future<void> alternarConcluida(Missao missao) async {
    await _firebase.collection(colecao).doc(missao.id).update({
      'concluida': !missao.concluida,
    });
  }

  Future<void> excluirMissao(String id) async {
    await _firebase.collection(colecao).doc(id).delete();
  }
}
