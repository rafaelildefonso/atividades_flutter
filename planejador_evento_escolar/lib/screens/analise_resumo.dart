import 'package:flutter/material.dart';
import '../models/atividade.dart';

const Map<ActivityType, String> _activityTypeLabels = {
  ActivityType.oficina: 'Oficina',
  ActivityType.palestra: 'Palestra',
  ActivityType.exposicao: 'Exposição',
  ActivityType.competencia: 'Competição',
  ActivityType.apresentacao: 'Apresentação cultural',
};

class SummaryAnalysisScreen extends StatelessWidget {
  final Activity? activity;
  final VoidCallback? onBack;

  const SummaryAnalysisScreen({Key? key, this.activity, this.onBack})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final act = activity ?? Activity();
    final steps = act.preparationStepsCompleted();
    final percent = steps / 7.0;
    final missing = act.missingFields();
    final alerts = act.analyzeAlerts();
    final situationReady = missing.isEmpty && alerts.isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumo e análise'),
        leading: onBack == null
            ? null
            : IconButton(icon: const Icon(Icons.arrow_back), onPressed: onBack),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: situationReady
                  ? Colors.green.withOpacity(0.12)
                  : Colors.orange.withOpacity(0.08),
              child: ListTile(
                title: Text(
                  situationReady ? 'Pronta para cadastro' : 'Requer atenção',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  situationReady
                      ? 'Todas as informações obrigatórias corretas.'
                      : 'Existem alertas que devem ser verificados.',
                ),
                leading: Icon(
                  situationReady ? Icons.check_circle : Icons.warning,
                  color: situationReady ? Colors.green : Colors.orange,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Barra de preparação: $steps de 7 (${(percent * 100).round()}%)',
            ),
            const SizedBox(height: 6),
            LinearProgressIndicator(value: percent),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 2,
                            child: Text('Atividade', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Expanded(flex: 4, child: Text(act.name.isEmpty ? '-' : act.name)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 2,
                            child: Text('Responsável', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Expanded(flex: 4, child: Text(act.responsible.isEmpty ? '-' : act.responsible)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 2,
                            child: Text('Tipo', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Expanded(flex: 4, child: Text(act.type == null ? '-' : _activityTypeLabels[act.type!] ?? '-')),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 2,
                            child: Text('Duração', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Expanded(flex: 4, child: Text(act.formattedDuration())),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 2,
                            child: Text('Capacidade', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Expanded(flex: 4, child: Text('${act.capacity} participantes')),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 2,
                            child: Text('Classificação', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Expanded(flex: 4, child: Text(act.classification())),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 2,
                            child: Text('Recursos ativos', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Expanded(flex: 4, child: Text('${act.resourcesCount()}')),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 2,
                            child: Text('Situação', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(alerts.isEmpty
                                ? (act.missingFields().isEmpty ? 'Pronta para cadastro' : 'Requer atenção')
                                : 'Requer atenção'),
                          ),
                        ],
                      ),
                    ),
                    if (alerts.isNotEmpty) const SizedBox(height: 12),
                    if (alerts.isNotEmpty)
                      const Text('Alertas:', style: TextStyle(fontWeight: FontWeight.bold)),
                    for (final a in alerts)
                      ListTile(title: Text(a), leading: const Icon(Icons.error_outline)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
