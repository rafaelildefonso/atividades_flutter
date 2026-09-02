import 'package:flutter/material.dart';
import '../services/voo_service.dart';

class VooProvider extends ChangeNotifier {
  final VooService _service = VooService();

  List<dynamic> voos = [];
  bool carregando = false;
  String? erro;
  String aeroporto = 'SBGR';
  String tipo = 'chegadas';

  Future<void> carregarVoos() async {
    carregando = true;
    erro = null;
    notifyListeners();

    try {
      final dados = await _service.fetchVoos(aeroporto, tipo);
      voos = dados['voos'] ?? [];
    } catch (e) {
      erro = 'Não foi possível carregar os voos.';
      voos = [];
    } finally {
      carregando = false;
      notifyListeners();
    }
  }

  void setAeroporto(String value) {
    aeroporto = value;
  }

  void setTipo(String value) {
    tipo = value;
  }
}
