import 'package:flutter/material.dart';

class Cidade {
  String nome;
  double temperatura;
  String condicaoClimatica;
  IconData icone;
  String imagemUrl;

  Cidade(this.nome, this.temperatura, this.condicaoClimatica, this.icone, this.imagemUrl);
}
