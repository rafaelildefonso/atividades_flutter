import 'package:app_clima/widgets/area_cidades.dart';
import 'package:app_clima/widgets/cidade_card.dart';
import 'package:app_clima/widgets/painel_informacoes.dart';
import 'package:flutter/material.dart';

class TelaClima extends StatelessWidget {
  const TelaClima({super.key});

  @override
  Widget build(BuildContext context) {
    // TELA PRINCIPAL - Monte aqui todos os elementos:

    // 1. BANNER PRINCIPAL
    // Usar Container + AspectRatio + FittedBox
    // Conteúdo: "☀️ Clima Agora" e "Confira as condições do tempo..."

    // 2. CATEGORIAS (Wrap)
    // Exemplo: Ensolarado, Chuvoso, Frio, Quente, Nublado, Vento Forte
    // (Desafio 4: adicionar "Tempestade")

    // 3. ÁREA DE CIDADES (AreaCidades widget)
    // Usar GridView.builder dentro de AreaCidades

    // 4. PAINEL DE INFORMAÇÕES (PainelInformacoes widget)
    // Card "Informações Extras"

    // --- RESPONSIVIDADE ---
    // Usar LayoutBuilder ou MediaQuery para detectar largura
    // Celular (<600): 1 coluna cidades, painel embaixo, só 4 cidades
    // Tablet (600-899): 2 colunas cidades, painel embaixo, todas cidades
    // Desktop (900+): 3 colunas cidades, painel ao lado, todas cidades

    // --- REGRAS EXTRAS ---
    // Regra 2: Exibir "Largura atual: XXX px - Dispositivo: Celular/Tablet/Desktop"
    // Regra 3: No desktop, exibir "🌎 Dados climáticos atualizados em tempo real."
    // Regra 4: No tablet, exibir botão "Ver previsão para 7 dias"

    // --- CONCEITOS OBRIGATÓRIOS ---
    // MediaQuery, LayoutBuilder, Expanded, SingleChildScrollView

    // --- DESAFIO 5 ---
    // Card "Cidade em destaque" apenas no celular

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Text("☀️ Clima Agora", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Confira as condições do tempo em diversas cidades."),
                ],
              ),
            ),
            Wrap(
              spacing: 8,
              children: [
                Chip(label: Text("Ensolarado")),
                Chip(label: Text("Chuvoso")),
                Chip(label: Text("Frio")),
                Chip(label: Text("Quente")),
                Chip(label: Text("Nublado")),
                Chip(label: Text("Vento Forte")),
                Chip(label: Text("Tempestade")),
              ],
            ),
            AreaCidades(),
            PainelInformacoes(),
          ],
        ),
      ),
    );
  }
}
