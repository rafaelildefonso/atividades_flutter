import 'package:flutter/material.dart';

class PainelInformacoes extends StatelessWidget {
  const PainelInformacoes({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Column(
        children: [
          Text(
            "Informações Extras",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("Umidade: 65%"),
          Text("Vento: 12 km/h"),
          Text("Sensação térmica: 30°C"),
          Text("Nascer do sol: 06:10"),
        ],
      ),
    );
  }
}
