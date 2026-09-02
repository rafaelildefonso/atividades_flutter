import 'package:flutter/material.dart';
import '../models/cidade_clima.dart';

class CidadeCard extends StatelessWidget {
  final CidadeClima cidade;

  const CidadeCard({super.key, required this.cidade});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (cidade.imagemUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  cidade.imagemUrl,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox(height: 100),
                ),
              ),
            ListTile(
              leading: Icon(cidade.icone, size: 36, color: Colors.orange),
              title: Text(
                cidade.nome,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${cidade.temperatura}°C - ${cidade.condicao}'),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Ver detalhes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
