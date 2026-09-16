import 'package:flutter/foundation.dart';
import '../models/filme.dart';
import '../services/filme_service.dart';

class FilmeViewModel extends ChangeNotifier {
  final FilmeService _service = FilmeService();
  List<Filme> _filmes = [];

  List<Filme> get filmes => _filmes;

  Future<void> carregarFilmes() async {
    _filmes = await _service.listarFilmes();
    notifyListeners();
  }

  Future<void> adicionarFilme(String titulo) async {
    if (titulo.trim().isEmpty) return;
    await _service.inserirFilme(Filme(titulo: titulo.trim(), assistido: false));
    await carregarFilmes();
  }

  Future<void> alternarAssistido(int id, bool assistido) async {
    await _service.atualizarAssistido(id, assistido);
    await carregarFilmes();
  }
}
