import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _banco;

  static Future<Database> getBanco() async {
    if (_banco != null) return _banco!;
    _banco = await _initBanco();
    return _banco!;
  }

  static Future<Database> _initBanco() async {
    final caminho = await getDatabasesPath();
    final caminhoBanco = join(caminho, 'estoque.db');

    return await openDatabase(
      caminhoBanco,
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE usuarios (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            email TEXT NOT NULL,
            senha TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE produtos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            categoria TEXT NOT NULL,
            quantidade INTEGER NOT NULL,
            preco REAL NOT NULL
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('''
            CREATE TABLE produtos (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              nome TEXT NOT NULL,
              categoria TEXT NOT NULL,
              quantidade INTEGER NOT NULL,
              preco REAL NOT NULL
            )
          ''');
        }
      },
    );
  }
}
