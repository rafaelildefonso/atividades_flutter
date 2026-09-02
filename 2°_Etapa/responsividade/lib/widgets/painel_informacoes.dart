import 'package:flutter/material.dart';

class PainelInformacoes extends StatelessWidget {
  const PainelInformacoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade50,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Informações Extras',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const ListTile(
              leading: Icon(Icons.water_drop),
              title: Text('Umidade'),
              trailing: Text('65%'),
            ),
            const ListTile(
              leading: Icon(Icons.air),
              title: Text('Vento'),
              trailing: Text('12 km/h'),
            ),
            const ListTile(
              leading: Icon(Icons.thermostat),
              title: Text('Sensação térmica'),
              trailing: Text('30°C'),
            ),
            const ListTile(
              leading: Icon(Icons.wb_sunny),
              title: Text('Nascer do sol'),
              trailing: Text('06:10'),
            ),
          ],
        ),
      ),
    );
  }
}
