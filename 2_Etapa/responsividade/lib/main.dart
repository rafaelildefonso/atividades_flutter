import 'package:flutter/material.dart';

import 'pages/tela_clima.dart';

void main() {
  runApp(const AppClima());
}

class AppClima extends StatelessWidget {
  const AppClima({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima Agora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.orange,
      ),
      home: const TelaClima(),
    );
  }
}
