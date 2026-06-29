import 'package:app_clima/models/cidade_clima.dart';
import 'package:flutter/material.dart';

class CidadeCard extends StatelessWidget {
  final Cidade cidade;

  const CidadeCard({
    super.key,
    required this.cidade,
  });

  @override
  Widget build(BuildContext context) {
    // Desafio 2: adicionar Image.network() com imagem da cidade

    return Card(
      child: Column(
        children: [
          SizedBox(child: Image.network(cidade.imagemUrl, fit: BoxFit.cover,)),
          Icon(cidade.icone, color: Colors.orange, size: 40),
          Text(cidade.nome),
          Text(cidade.temperatura.toString()),
          Text(cidade.condicaoClimatica),
          ElevatedButton(
              onPressed: () {
                print("Ver detalhes da cidade ${cidade.nome} clicado");
              },
              child: Text("Ver detalhes")),
        ],
      ),
    );
  }
}
