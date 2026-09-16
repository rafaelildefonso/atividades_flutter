import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/voo_provider.dart';
import './detalhes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _aeroportoController = TextEditingController(text: 'SBGR');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VooProvider>().carregarVoos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<VooProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Voos'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _aeroportoController,
                    decoration: const InputDecoration(
                      labelText: 'Código ICAO',
                      border: OutlineInputBorder(),
                      hintText: 'SBGR',
                    ),
                    textCapitalization: TextCapitalization.characters,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    provider.setAeroporto(
                      _aeroportoController.text.toUpperCase(),
                    );
                    provider.carregarVoos();
                  },
                  child: const Text('Buscar'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'chegadas', label: Text('Chegadas')),
                ButtonSegment(value: 'partidas', label: Text('Partidas')),
                ButtonSegment(value: 'todos', label: Text('Todos')),
              ],
              selected: {provider.tipo},
              onSelectionChanged: (selection) {
                provider.setTipo(selection.first);
                provider.carregarVoos();
              },
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: _buildBody(provider),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(VooProvider provider) {
    if (provider.carregando) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.erro != null) {
      return Center(child: Text(provider.erro!));
    }

    if (provider.voos.isEmpty) {
      return const Center(child: Text('Nenhum voo encontrado.'));
    }

    return ListView.builder(
      itemCount: provider.voos.length,
      itemBuilder: (context, index) {
        final voo = provider.voos[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: ListTile(
            title: Text(
              voo['identificacao'] ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '${voo['local'] ?? ''}  •  ${voo['partida'] ?? ''} → ${voo['chegada'] ?? ''}',
            ),
            trailing: Text(voo['tipo_aeronave'] ?? ''),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetalhesPage(voo: voo),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
