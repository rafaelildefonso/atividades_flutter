import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/filme_viewmodel.dart';
import 'pages/pagina_inicial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FilmeViewModel(),
      child: MaterialApp(
        title: 'Minha Lista de Filmes',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const PaginaInicial(),
      ),
    );
  }
}
