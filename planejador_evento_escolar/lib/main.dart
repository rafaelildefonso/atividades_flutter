import 'package:flutter/material.dart';
import 'screens/config_atividade.dart';

void main() {
  runApp(const PlannerApp());
}

class PlannerApp extends StatelessWidget {
  const PlannerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planejador de Atividades',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const ActivityConfigScreen(),
    );
  }
}
