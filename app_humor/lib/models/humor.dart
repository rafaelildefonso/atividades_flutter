import 'package:flutter/material.dart';

class HumorData {
  const HumorData({
    required this.name,
    required this.title,
    required this.description,
    required this.message,
    required this.icon,
    required this.primaryColor,
    required this.backgroundColor,
    required this.borderRadius,
    required this.sceneWidgets,
    required this.cardWidth,
  });
  final String name;
  final String title;
  final String description;
  final String message;
  final IconData icon;
  final Color primaryColor;
  final Color backgroundColor;
  final double borderRadius;
  final List<Widget> sceneWidgets;
  final double cardWidth;
}

Widget _floatingIcon({
  required IconData icon,
  required Alignment begin,
  required Alignment end,
  required Color color,
  double size = 24,
}) {
  return TweenAnimationBuilder<Alignment>(
    tween: AlignmentTween(begin: begin, end: end),
    duration: const Duration(milliseconds: 1400),
    curve: Curves.easeInOut,
    builder: (context, alignment, child) {
      return Align(alignment: alignment, child: child);
    },
    child: Icon(icon, size: size, color: color),
  );
}

Widget _floatingDot({
  required Alignment begin,
  required Alignment end,
  required Color color,
  double size = 10,
}) {
  return TweenAnimationBuilder<Alignment>(
    tween: AlignmentTween(begin: begin, end: end),
    duration: const Duration(milliseconds: 1600),
    curve: Curves.easeInOutSine,
    builder: (context, alignment, child) {
      return Align(alignment: alignment, child: child);
    },
    child: Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    ),
  );
}

final HumorData feliz = HumorData(
  name: 'Feliz',
  title: 'Hoje estou feliz!',
  description: 'Um dia de sol, energia leve e sorrisos ao redor.',
  message: 'Você escolheu o humor Feliz. Que bom ver essa energia positiva!',
  icon: Icons.sentiment_very_satisfied,
  primaryColor: Colors.amber.shade700,
  backgroundColor: Colors.amber.shade100,
  borderRadius: 32,
  cardWidth: 360,
  sceneWidgets: [
      _floatingIcon(
        icon: Icons.wb_sunny,
        begin: const Alignment(-0.9, -0.9),
        end: const Alignment(-0.6, -0.7),
        color: Colors.yellow.shade200,
        size: 44,
      ),
      _floatingDot(
        begin: const Alignment(0.8, -0.5),
        end: const Alignment(0.9, -0.2),
        color: Colors.white,
        size: 12,
      ),
      _floatingDot(
        begin: const Alignment(0.4, -0.1),
        end: const Alignment(0.6, 0.1),
        color: Colors.white,
      ),
    ],
);

final HumorData calmo = HumorData(
  name: 'Calmo',
  title: 'Momento de tranquilidade.',
  description: 'Nuvens suaves e paz em cada respiração.',
  message: 'Você escolheu o humor Calmo. Respire, observe e relaxe.',
  icon: Icons.cloud,
  primaryColor: Colors.blue.shade700,
  backgroundColor: Colors.blue.shade100,
  borderRadius: 24,
  cardWidth: 320,
  sceneWidgets: [
      _floatingIcon(
        icon: Icons.cloud,
        begin: const Alignment(-0.8, -0.6),
        end: const Alignment(-0.5, -0.5),
        color: Colors.white70,
        size: 56,
      ),
      _floatingDot(
        begin: const Alignment(0.6, -0.2),
        end: const Alignment(0.5, 0.3),
        color: Colors.blue.shade50,
        size: 18,
      ),
      _floatingDot(
        begin: const Alignment(0.8, 0.5),
        end: const Alignment(0.9, 0.7),
        color: Colors.blue.shade50,
      ),
    ],
);

final HumorData animado = HumorData(
  name: 'Animado',
  title: 'Energia total!',
  description: 'Forte, vibrante e pronto para brilhar.',
  message: 'Você escolheu o humor Animado. A energia está no máximo!',
  icon: Icons.bolt,
  primaryColor: Colors.deepOrange.shade700,
  backgroundColor: Colors.orange.shade50,
  borderRadius: 28,
  cardWidth: 380,
  sceneWidgets: [
      _floatingIcon(
        icon: Icons.flash_on,
        begin: const Alignment(-0.9, -0.7),
        end: const Alignment(-0.6, -0.4),
        color: Colors.yellow.shade200,
        size: 42,
      ),
      _floatingIcon(
        icon: Icons.star,
        begin: const Alignment(0.6, -0.8),
        end: const Alignment(0.8, -0.6),
        color: Colors.white,
        size: 28,
      ),
      _floatingDot(
        begin: const Alignment(0.3, 0.4),
        end: const Alignment(0.6, 0.1),
        color: Colors.yellow.shade100,
      ),
    ],
);

final HumorData triste = HumorData(
  name: 'Triste',
  title: 'Hoje estou triste.',
  description: 'Nuvens cinza e gotas de chuva suavemente caindo.',
  message: 'Você escolheu o humor Triste. Tudo bem sentir-se assim.',
  icon: Icons.sentiment_dissatisfied,
  primaryColor: Colors.indigo.shade700,
  backgroundColor: Colors.indigo.shade100,
  borderRadius: 20,
  cardWidth: 340,
  sceneWidgets: [
      _floatingIcon(
        icon: Icons.cloud,
        begin: const Alignment(-0.7, -0.7),
        end: const Alignment(-0.4, -0.5),
        color: Colors.blueGrey.shade100,
        size: 52,
      ),
      _floatingDot(
        begin: const Alignment(0.5, -0.2),
        end: const Alignment(0.5, 0.2),
        color: Colors.lightBlue.shade100,
        size: 14,
      ),
      _floatingDot(
        begin: const Alignment(0.7, -0.1),
        end: const Alignment(0.7, 0.3),
        color: Colors.lightBlue.shade100,
      ),
    ],
);

final HumorData surpreso = HumorData(
  name: 'Surpreso',
  title: 'Que surpresa!',
  description: 'O inesperado faz o coração acelerar.',
  message: 'Você escolheu o humor Surpreso. Que momento interessante!',
  icon: Icons.visibility,
  primaryColor: Colors.purple.shade700,
  backgroundColor: Colors.purple.shade100,
  borderRadius: 30,
  cardWidth: 330,
  sceneWidgets: [
      _floatingIcon(
        icon: Icons.lightbulb,
        begin: const Alignment(-0.8, -0.8),
        end: const Alignment(-0.6, -0.6),
        color: Colors.amber.shade200,
        size: 40,
      ),
      _floatingIcon(
        icon: Icons.star_outline,
        begin: const Alignment(0.8, -0.6),
        end: const Alignment(0.9, -0.4),
        color: Colors.white,
        size: 30,
      ),
      _floatingDot(
        begin: const Alignment(0.2, 0.4),
        end: const Alignment(0.5, 0.1),
        color: Colors.white70,
      ),
    ],
);

final List<HumorData> humorList = [feliz, calmo, animado, triste, surpreso];

final Map<String, HumorData> humorByKey = {
  'feliz': feliz,
  'calmo': calmo,
  'animado': animado,
  'triste': triste,
  'surpreso': surpreso,
};
