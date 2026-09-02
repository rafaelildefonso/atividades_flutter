import 'package:flutter/material.dart';

class DetalhesPage extends StatelessWidget {
  final Map<String, dynamic> voo;

  const DetalhesPage({super.key, required this.voo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(voo['identificacao'] ?? 'Detalhes'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _item('Identificação', voo['identificacao']),
            _item('Categoria', voo['categoria']),
            _item('Aeronave', voo['tipo_aeronave']),
            _item('Origem/Destino', voo['local']),
            _item('Partida', voo['partida']),
            _item('Chegada', voo['chegada']),
          ],
        ),
      ),
    );
  }

  Widget _item(String titulo, String? valor) {
    return ListTile(
      title: Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(valor ?? '-'),
    );
  }
}
