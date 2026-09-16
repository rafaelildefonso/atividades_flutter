import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'pages/tela_personalizar_perfil.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MeuApp(),
    ),
  );
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personalizador de Perfil',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const TelaPersonalizarPerfil(),
    );
  }
}
