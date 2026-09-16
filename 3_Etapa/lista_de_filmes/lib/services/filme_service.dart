import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/filme.dart';

class FilmeService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'filmes.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE filmes(id INTEGER PRIMARY KEY AUTOINCREMENT, titulo TEXT NOT NULL, assistido INTEGER NOT NULL)',
        );
      },
    );
  }

  Future<void> inserirFilme(Filme filme) async {
    final db = await database;
    await db.insert('filmes', filme.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Filme>> listarFilmes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('filmes');
    return List.generate(maps.length, (i) => Filme.fromMap(maps[i]));
  }

  Future<void> atualizarAssistido(int id, bool assistido) async {
    final db = await database;
    await db.update(
      'filmes',
      {'assistido': assistido ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
