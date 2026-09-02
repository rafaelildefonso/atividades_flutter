import 'package:flutter/material.dart';
import '../models/cidade_clima.dart';
import '../widgets/area_cidades.dart';
import '../widgets/painel_informacoes.dart';

class TelaClima extends StatelessWidget {
  const TelaClima({super.key});

  static const _cidades = [
    CidadeClima(
      nome: 'Belo Horizonte',
      temperatura: 28,
      condicao: 'Ensolarado',
      icone: Icons.wb_sunny,
      imagemUrl:
          'https://images.unsplash.com/photo-1550596334-8b142b8e1095?w=400&q=80',
    ),
    CidadeClima(
      nome: 'Curitiba',
      temperatura: 17,
      condicao: 'Chuvoso',
      icone: Icons.umbrella,
      imagemUrl:
          'https://images.unsplash.com/photo-1519692933481-e162a57d6721?w=400&q=80',
    ),
    CidadeClima(
      nome: 'São Paulo',
      temperatura: 22,
      condicao: 'Nublado',
      icone: Icons.cloud,
      imagemUrl:
          'https://images.unsplash.com/photo-1587024416407-3b6e2e0f2d74?w=400&q=80',
    ),
    CidadeClima(
      nome: 'Rio de Janeiro',
      temperatura: 35,
      condicao: 'Quente',
      icone: Icons.whatshot,
      imagemUrl:
          'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=400&q=80',
    ),
    CidadeClima(
      nome: 'Porto Alegre',
      temperatura: 10,
      condicao: 'Frio',
      icone: Icons.ac_unit,
      imagemUrl:
          'https://images.unsplash.com/photo-1476610182048-b716b8518aae?w=400&q=80',
    ),
    CidadeClima(
      nome: 'Recife',
      temperatura: 30,
      condicao: 'Vento Forte',
      icone: Icons.air,
      imagemUrl:
          'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=400&q=80',
    ),
    CidadeClima(
      nome: 'Brasília',
      temperatura: 27,
      condicao: 'Ensolarado',
      icone: Icons.wb_sunny,
      imagemUrl:
          'https://images.unsplash.com/photo-1514924013411-cbf25f2a515a?w=400&q=80',
    ),
    CidadeClima(
      nome: 'Salvador',
      temperatura: 31,
      condicao: 'Quente',
      icone: Icons.whatshot,
      imagemUrl:
          'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=400&q=80',
    ),
    CidadeClima(
      nome: 'Florianópolis',
      temperatura: 20,
      condicao: 'Chuvoso',
      icone: Icons.umbrella,
      imagemUrl:
          'https://images.unsplash.com/photo-1495578942203-6940b9cdf390?w=400&q=80',
    ),
    CidadeClima(
      nome: 'Manaus',
      temperatura: 33,
      condicao: 'Nublado',
      icone: Icons.cloud,
      imagemUrl:
          'https://images.unsplash.com/photo-1590608897865-7ed2b54f63f6?w=400&q=80',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        final largura = constraints.maxWidth;
        final celular = largura < 600;
        final tablet = largura >= 600 && largura < 900;
        final desktop = largura >= 900;

        final colunas = celular ? 1 : tablet ? 2 : 4;
        final cidadesExibidas = celular ? _cidades.take(4).toList() : _cidades;

        final dispositivo =
            celular ? 'Celular' : tablet ? 'Tablet' : 'Desktop';

        return Scaffold(
          appBar: AppBar(
            title: const Text('Clima Agora'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: celular ? 16 / 9 : 16 / 5,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.orange, Colors.deepOrange],
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Center(
                      child: FittedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('☀️', style: TextStyle(fontSize: 48)),
                            Text(
                              'Clima Agora',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Confira as condições do tempo em diversas cidades.',
                              style: TextStyle(color: Colors.white70, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Text(
                  'Largura atual: ${larguraTela.toStringAsFixed(0)} px  |  Dispositivo: $dispositivo',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),

                if (desktop)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.public, color: Colors.green),
                        SizedBox(width: 8),
                        Text(
                          '\u{1F30D} Dados climáticos atualizados em tempo real.',
                        ),
                      ],
                    ),
                  ),

                if (tablet)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.calendar_month),
                      label: const Text('Ver previsão para 7 dias'),
                    ),
                  ),

                const SizedBox(height: 10),
                const Text(
                  'Categorias',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Chip(label: Text('\u{2600}\u{FE0F} Ensolarado')),
                    Chip(label: Text('\u{1F327}\u{FE0F} Chuvoso')),
                    Chip(label: Text('\u{1F976} Frio')),
                    Chip(label: Text('\u{1F525} Quente')),
                    Chip(label: Text('\u{2601}\u{FE0F} Nublado')),
                    Chip(label: Text('\u{1F4A8} Vento Forte')),
                  ],
                ),
                const SizedBox(height: 25),

                if (desktop)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: AreaCidades(
                          cidades: cidadesExibidas,
                          colunas: colunas,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Expanded(
                        flex: 1,
                        child: PainelInformacoes(),
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      AreaCidades(
                        cidades: cidadesExibidas,
                        colunas: colunas,
                      ),
                      const SizedBox(height: 20),
                      const PainelInformacoes(),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
