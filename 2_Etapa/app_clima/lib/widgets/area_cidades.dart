import 'package:app_clima/models/cidade_clima.dart';
import 'package:app_clima/widgets/cidade_card.dart';
import 'package:flutter/material.dart';

class AreaCidades extends StatelessWidget {
  AreaCidades({super.key});

  List<Cidade> cidades = [
    Cidade(
      'Belo Horizonte',
      28,
      'Ensolarado',
      Icons.wb_sunny,
      'https://picsum.photos/seed/bh/400/300',
    ),
    Cidade(
      'Curitiba',
      17,
      'Chuvoso',
      Icons.water,
      'https://picsum.photos/seed/curitiba/400/300',
    ),
    Cidade(
      'São Paulo',
      22,
      'Nublado',
      Icons.cloud,
      'https://picsum.photos/seed/sp/400/300',
    ),
    Cidade(
      'Rio de Janeiro',
      30,
      'Quente',
      Icons.thermostat,
      'https://picsum.photos/seed/rj/400/300',
    ),
    Cidade(
      'Porto Alegre',
      15,
      'Frio',
      Icons.ac_unit,
      'https://picsum.photos/seed/poa/400/300',
    ),
    Cidade(
      'Fortaleza',
      32,
      'Ensolarado',
      Icons.wb_sunny,
      'https://picsum.photos/seed/fortaleza/400/300',
    ),
    Cidade(
      'Salvador',
      29,
      'Ensolarado',
      Icons.wb_sunny,
      'https://picsum.photos/seed/salvador/400/300',
    ),
    Cidade(
      'Brasília',
      25,
      'Nublado',
      Icons.cloud,
      'https://picsum.photos/seed/brasilia/400/300',
    ),
    Cidade(
      'Manaus',
      35,
      'Quente',
      Icons.thermostat,
      'https://picsum.photos/seed/manaus/400/300',
    ),
    Cidade(
      'Florianópolis',
      19,
      'Chuvoso',
      Icons.water,
      'https://picsum.photos/seed/floripa/400/300',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final largura = constraints.maxWidth;
      int colunas;
      int totalCidades;

      if (largura < 600) {
        colunas = 1;
        totalCidades = 4;
      } else if (largura < 900) {
        colunas = 2;
        totalCidades = cidades.length;
      } else {
        colunas = 4;
        totalCidades = cidades.length;
      }

      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: colunas,
            childAspectRatio: 0.75,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8),
        itemCount: totalCidades,
        itemBuilder: (context, index) => CidadeCard(cidade: cidades[index]),
      );
    });
  }
}
