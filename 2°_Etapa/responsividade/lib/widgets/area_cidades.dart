import 'package:flutter/material.dart';
import '../models/cidade_clima.dart';
import 'cidade_card.dart';

class AreaCidades extends StatelessWidget {
  final List<CidadeClima> cidades;
  final int colunas;

  const AreaCidades({
    super.key,
    required this.cidades,
    required this.colunas,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cidades',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cidades.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: colunas,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: colunas == 1 ? 200 : 210,
          ),
          itemBuilder: (context, index) {
            return CidadeCard(cidade: cidades[index]);
          },
        ),
      ],
    );
  }
}
