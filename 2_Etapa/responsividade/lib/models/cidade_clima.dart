import 'package:flutter/material.dart';

class CidadeClima {
  final String nome;
  final int temperatura;
  final String condicao;
  final IconData icone;
  final String imagemUrl;

  const CidadeClima({
    required this.nome,
    required this.temperatura,
    required this.condicao,
    required this.icone,
    this.imagemUrl = '',
  });
}
