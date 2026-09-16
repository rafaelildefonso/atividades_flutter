import 'package:flutter/material.dart';
import '../models/usuario.dart';
import '../services/usuario_service.dart';

class UsuarioProvider extends ChangeNotifier {
  final UsuarioService _service = UsuarioService();
  Usuario? _usuarioLogado;

  Usuario? get usuarioLogado => _usuarioLogado;

  Future<String?> cadastrar(String nome, String email, String senha) async {
    final existe = await _service.emailExiste(email);
    if (existe) {
      return 'E-mail já cadastrado.';
    }

    final usuario = Usuario(nome: nome, email: email, senha: senha);
    await _service.cadastrarUsuario(usuario);
    notifyListeners();
    return null;
  }

  Future<bool> login(String email, String senha) async {
    final usuario = await _service.login(email, senha);
    if (usuario != null) {
      _usuarioLogado = usuario;
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _usuarioLogado = null;
    notifyListeners();
  }
}
