import 'package:flutter/material.dart';
import '../models/atividade.dart';
import 'analise_resumo.dart';

const _typeLabels = {
  ActivityType.oficina: 'Oficina',
  ActivityType.palestra: 'Palestra',
  ActivityType.exposicao: 'Exposição',
  ActivityType.competencia: 'Competição',
  ActivityType.apresentacao: 'Apresentação cultural',
};

const _typeIcons = {
  ActivityType.oficina: Icons.build,
  ActivityType.palestra: Icons.school,
  ActivityType.exposicao: Icons.photo,
  ActivityType.competencia: Icons.sports_martial_arts,
  ActivityType.apresentacao: Icons.music_note,
};

const _typeColors = {
  ActivityType.oficina: Colors.green,
  ActivityType.palestra: Colors.indigo,
  ActivityType.exposicao: Colors.brown,
  ActivityType.competencia: Colors.red,
  ActivityType.apresentacao: Colors.purple,
};

class ActivityConfigScreen extends StatefulWidget {
  const ActivityConfigScreen({Key? key}) : super(key: key);

  @override
  State<ActivityConfigScreen> createState() => _ActivityConfigScreenState();
}

class _ActivityConfigScreenState extends State<ActivityConfigScreen> {
  final Activity _activity = Activity();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _responsibleController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  bool _showSummary = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = _activity.name;
    _responsibleController.text = _activity.responsible;
    _locationController.text = _activity.location;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _responsibleController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _clearForm() {
    setState(() {
      _activity.name = '';
      _activity.responsible = '';
      _activity.location = '';
      _activity.durationMinutes = 60;
      _activity.capacity = 5;
      _activity.type = null;
      _activity.projetor = false;
      _activity.computadores = false;
      _activity.som = false;
      _activity.internet = false;
      _activity.mesas = false;
      _nameController.text = '';
      _responsibleController.text = '';
      _locationController.text = '';
    });
  }

  void _onTypeSelected(ActivityType t) {
    setState(() {
      _activity.type = t;
      if (t == ActivityType.palestra) {
        _activity.projetor = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final steps = _activity.preparationStepsCompleted();
    return Scaffold(
      appBar: AppBar(title: const Text('Configuração da atividade')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(child: Text('Menu')),
            ListTile(
              title: const Text('Nova atividade'),
              onTap: () {
                _clearForm();
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Atividade atual'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('Limpar formulário'),
              onTap: () {
                _clearForm();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Formulário restaurado')),
                );
              },
            ),
            ListTile(
              title: const Text('Sobre o evento'),
              onTap: () => showAboutDialog(
                context: context,
                applicationName: 'Feira Escolar',
              ),
            ),
          ],
        ),
      ),
      body: _showSummary
          ? SummaryAnalysisScreen(
              activity: _activity,
              onBack: () {
                setState(() => _showSummary = false);
              },
            )
          : Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nome da atividade',
                      ),
                      onChanged: (v) => setState(() => _activity.name = v),
                    ),
                    TextFormField(
                      controller: _responsibleController,
                      decoration: const InputDecoration(
                        labelText: 'Responsável',
                      ),
                      onChanged: (v) =>
                          setState(() => _activity.responsible = v),
                    ),
                    TextFormField(
                      controller: _locationController,
                      decoration: const InputDecoration(
                        labelText: 'Sala / Local',
                      ),
                      onChanged: (v) => setState(() => _activity.location = v),
                    ),
                    const SizedBox(height: 12),
                    const Text('Tipo de atividade'),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: ActivityType.values.map((t) {
                        final label = _typeLabels[t] ?? '';
                        final selected = _activity.type == t;
                        return ChoiceChip(
                          label: Text(label),
                          selected: selected,
                          onSelected: (_) => _onTypeSelected(t),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 12),
                    const Text('Duração'),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              final newVal = _activity.durationMinutes - 15;
                              _activity.durationMinutes = newVal < 15
                                  ? 15
                                  : newVal;
                            });
                          },
                        ),
                        Expanded(
                          child: Center(
                            child: Text(_activity.formattedDuration()),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              final newVal = _activity.durationMinutes + 15;
                              _activity.durationMinutes = newVal > 180
                                  ? 180
                                  : newVal;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ExpansionTile(
                      title: const Text('Recursos necessários'),
                      children: [
                        SwitchListTile(
                          title: const Text('Projetor'),
                          value: _activity.projetor,
                          onChanged: (v) =>
                              setState(() => _activity.projetor = v),
                        ),
                        SwitchListTile(
                          title: const Text('Computadores'),
                          value: _activity.computadores,
                          onChanged: (v) =>
                              setState(() => _activity.computadores = v),
                        ),
                        SwitchListTile(
                          title: Row(
                            children: [
                              const Text('Sistema de som'),
                              if (_activity.type == ActivityType.apresentacao)
                                const Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(
                                    '(Recomendado)',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          value: _activity.som,
                          onChanged: (v) => setState(() => _activity.som = v),
                        ),
                        SwitchListTile(
                          title: const Text('Acesso à internet'),
                          value: _activity.internet,
                          onChanged: (v) =>
                              setState(() => _activity.internet = v),
                        ),
                        SwitchListTile(
                          title: const Text('Mesas adicionais'),
                          value: _activity.mesas,
                          onChanged: (v) => setState(() => _activity.mesas = v),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text('Capacidade (participantes)'),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => setState(() {
                            final newVal = _activity.capacity - 1;
                            _activity.capacity = newVal < 5 ? 5 : newVal;
                          }),
                        ),
                        Expanded(
                          child: Center(
                            child: Text('${_activity.capacity} participantes'),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => setState(() {
                            final newVal = _activity.capacity + 1;
                            _activity.capacity = newVal > 100 ? 100 : newVal;
                          }),
                        ),
                      ],
                    ),
                    Text('Classificação: ${_activity.classification()}'),
                    const SizedBox(height: 12),
                    Column(
                      children: [
                        if (_activity.computadores && _activity.capacity > 30)
                          Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.amber.withOpacity(0.2),
                            child: const Text(
                              'Verifique se o laboratório possui computadores suficientes.',
                            ),
                          ),
                        if (_activity.type == ActivityType.competencia &&
                            _activity.durationMinutes < 60)
                          Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.red.withOpacity(0.12),
                            child: const Text(
                              'Atenção: Competição deve ter ao menos 60 minutos.',
                            ),
                          ),
                        if (_activity.type == ActivityType.apresentacao &&
                            !_activity.som)
                          Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.blue.withOpacity(0.08),
                            child: const Text(
                              'Recomendado: sistema de som para apresentação cultural.',
                            ),
                          ),
                        if (_activity.classification() == 'Atividade grande' &&
                            !_activity.mesas)
                          Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.orange.withOpacity(0.08),
                            child: const Text(
                              'Atividade grande sem mesas adicionais.',
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _activity.type == null
                              ? Theme.of(context).colorScheme.primary
                              : _typeColors[_activity.type] ??
                                    Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                _activity.type == null
                                    ? Icons.event
                                    : _typeIcons[_activity.type] ?? Icons.event,
                                color: _activity.type == null
                                    ? Theme.of(context).colorScheme.primary
                                    : _typeColors[_activity.type] ??
                                          Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  _activity.name.isEmpty
                                      ? 'Nome da atividade'
                                      : _activity.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Tipo: ${_activity.type == null ? '-' : _typeLabels[_activity.type] ?? '-'}',
                          ),
                          Text('Duração: ${_activity.formattedDuration()}'),
                          Text(
                            'Capacidade: ${_activity.capacity} participantes',
                          ),
                          Text('Classificação: ${_activity.classification()}'),
                          Text(
                            'Recursos ativos: ${_activity.resourcesCount()}',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.analytics),
        label: Text('Analisar - $steps de 7'),
        onPressed: () {
          final missing = _activity.missingFields();
          if (missing.isNotEmpty) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(missing.join('\n'))));
            return;
          }
          setState(() => _showSummary = true);
        },
      ),
    );
  }
}
