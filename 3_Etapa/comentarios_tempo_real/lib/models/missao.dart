import 'package:cloud_firestore/cloud_firestore.dart';

class Missao {
  String id;
  String titulo;
  int grau;
  bool concluida;
  String usuarioId;
  String nomeUsuario;
  Timestamp? dataCriacao;

  Missao({
    required this.id,
    required this.titulo,
    required this.grau,
    required this.concluida,
    required this.usuarioId,
    this.nomeUsuario = '',
    this.dataCriacao,
  });

  factory Missao.fromMap(String id, Map<String, dynamic> dados) {
    return Missao(
      id: id,
      titulo: dados['titulo'] ?? '',
      grau: dados['grau'] ?? 0,
      concluida: dados['concluida'] ?? false,
      usuarioId: dados['usuarioId'] ?? '',
      nomeUsuario: dados['nomeUsuario'] ?? '',
      dataCriacao: dados['dataCriacao'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'grau': grau,
      'concluida': concluida,
      'usuarioId': usuarioId,
      'nomeUsuario': nomeUsuario,
    };
  }
}
