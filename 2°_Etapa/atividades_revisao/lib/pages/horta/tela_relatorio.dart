import 'package:flutter/material.dart';

class TelaRelatorio extends StatelessWidget {
  final String nomePlanta;
  final int nivelAgua;
  final String situacaoPlanta;
  const TelaRelatorio(
      {super.key,
      required this.nomePlanta,
      required this.nivelAgua,
      required this.situacaoPlanta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 10,
          children: [
            Text("Nome da planta: $nomePlanta%"),
            Text("Nivel da agua: $nivelAgua%"),
            Text("Situação da planta: $situacaoPlanta"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                  );
                },
                child: Text("Voltar")),
          ],
        ),
      ),
    );
  }
}
