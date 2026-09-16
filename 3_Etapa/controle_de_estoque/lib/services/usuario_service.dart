import 'package:sqflite/sqflite.dart';
import '../models/usuario.dart';
import 'database_helper.dart';

class UsuarioService {
  Future<Database> get banco async => await DatabaseHelper.getBanco();

  Future<bool> emailExiste(String email) async {
    final db = await banco;
    final resultado = await db.query(
      'usuarios',
      where: 'email = ?',
      whereArgs: [email],
    );
    return resultado.isNotEmpty;
  }

  Future<void> cadastrarUsuario(Usuario usuario) async {
    final db = await banco;
    await db.insert('usuarios', usuario.toMap());
    print('INSERT → Usuário cadastrado: ${usuario.nome}');
  }

  Future<Usuario?> login(String email, String senha) async {
    final db = await banco;
    print('SELECT → Procurando usuário: $email');

    final resultado = await db.query(
      'usuarios',
      where: 'email = ? AND senha = ?',
      whereArgs: [email, senha],
    );

    if (resultado.isNotEmpty) {
      final usuario = Usuario.fromMap(resultado.first);
      print('SELECT → Usuário encontrado: ${usuario.nome}');
      return usuario;
    } else {
      print('SELECT → Usuário não encontrado');
      return null;
    }
  }

  Future<void> mostrarUsuariosNoTerminal() async {
    final db = await banco;
    final usuarios = await db.query('usuarios');
    print('===== USUÁRIOS NO BANCO =====');
    for (final usuario in usuarios) {
      print(usuario);
    }
  }
}
