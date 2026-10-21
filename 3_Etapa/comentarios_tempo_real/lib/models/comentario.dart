import 'package:cloud_firestore/cloud_firestore.dart';

/// Modelo de um comentário feito em uma publicação (missão).
///
/// Cada comentário guarda o texto, o nome de quem comentou, o UID do
/// usuário e o identificador da publicação (`missaoId`) à qual pertence.
class Comentario {
  String id;
  String texto;
  String nomeUsuario;
  String usuarioId;
  String missaoId;
  Timestamp? dataCriacao;

  Comentario({
    required this.id,
    required this.texto,
    required this.nomeUsuario,
    required this.usuarioId,
    required this.missaoId,
    this.dataCriacao,
  });

  factory Comentario.fromMap(String id, Map<String, dynamic> dados) {
    return Comentario(
      id: id,
      texto: dados['texto'] ?? '',
      nomeUsuario: dados['nomeUsuario'] ?? '',
      usuarioId: dados['usuarioId'] ?? '',
      missaoId: dados['missaoId'] ?? '',
      dataCriacao: dados['dataCriacao'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'texto': texto,
      'nomeUsuario': nomeUsuario,
      'usuarioId': usuarioId,
      'missaoId': missaoId,
    };
  }
}
