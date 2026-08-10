enum ActivityType { oficina, palestra, exposicao, competencia, apresentacao }

class Activity {
  String name = '';
  String responsible = '';
  String location = '';
  int durationMinutes = 60;
  int capacity = 5;
  ActivityType? type;
  bool projetor = false;
  bool computadores = false;
  bool som = false;
  bool internet = false;
  bool mesas = false;

  Activity();

  int resourcesCount() {
    return [
      projetor,
      computadores,
      som,
      internet,
      mesas,
    ].where((r) => r).length;
  }

  String formattedDuration() {
    final h = durationMinutes ~/ 60;
    final m = durationMinutes % 60;
    if (h > 0 && m > 0) return '${h} hora${h > 1 ? 's' : ''} e ${m} minutos';
    if (h > 0) return '${h} hora${h > 1 ? 's' : ''}';
    return '${m} minutos';
  }

  String classification() {
    if (capacity <= 20) return 'Atividade pequena';
    if (capacity <= 50) return 'Atividade média';
    return 'Atividade grande';
  }

  bool isDurationValid() {
    return durationMinutes >= 15 && durationMinutes <= 180;
  }

  bool isCapacityValid() {
    return capacity >= 5 && capacity <= 100;
  }

  List<String> missingFields() {
    final List<String> missing = [];
    if (name.trim().isEmpty) missing.add('Nome da atividade');
    if (responsible.trim().isEmpty) missing.add('Responsável');
    if (location.trim().isEmpty) missing.add('Local');
    if (type == null) missing.add('Tipo da atividade');
    if (!isDurationValid()) missing.add('Duração válida');
    if (!isCapacityValid()) missing.add('Capacidade válida');
    if (resourcesCount() == 0) missing.add('Pelo menos um recurso analisado');
    return missing;
  }

  int preparationStepsCompleted() {
    int c = 0;
    if (name.trim().isNotEmpty) c++;
    if (responsible.trim().isNotEmpty) c++;
    if (location.trim().isNotEmpty) c++;
    if (type != null) c++;
    if (isDurationValid()) c++;
    if (isCapacityValid()) c++;
    if (resourcesCount() > 0) c++;
    return c;
  }

  List<String> analyzeAlerts() {
    final List<String> alerts = [];
    if (computadores && capacity > 30) {
      alerts.add('Verifique se o laboratório possui computadores suficientes.');
    }
    if (type == ActivityType.competencia && durationMinutes < 60) {
      alerts.add('Competição deve ter duração mínima de 60 minutos.');
    }
    if (type == ActivityType.apresentacao && !som) {
      alerts.add('Sistema de som recomendado para apresentação cultural.');
    }
    if (classification() == 'Atividade grande' && !mesas) {
      alerts.add('Atividade grande sem mesas adicionais.');
    }
    return alerts;
  }
}
