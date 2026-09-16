import 'package:sqflite/sqflite.dart';
import '../models/produto.dart';
import 'database_helper.dart';

class ProdutoService {
  Future<Database> get banco async => await DatabaseHelper.getBanco();

  Future<void> cadastrarProduto(Produto produto) async {
    final db = await banco;
    await db.insert('produtos', produto.toMap());
    print('INSERT → Produto cadastrado: ${produto.nome}');
  }

  Future<List<Produto>> listarProdutos() async {
    final db = await banco;
    final resultado = await db.query('produtos');

    print('SELECT → Produtos encontrados:');
    for (final produto in resultado) {
      print('{id: ${produto['id']}, nome: ${produto['nome']}, quantidade: ${produto['quantidade']}}');
    }

    return resultado.map((map) => Produto.fromMap(map)).toList();
  }

  Future<void> atualizarQuantidade(int id, String nome, int quantidadeAnterior, int novaQuantidade) async {
    final db = await banco;
    await db.update(
      'produtos',
      {'quantidade': novaQuantidade},
      where: 'id = ?',
      whereArgs: [id],
    );
    print('UPDATE → $nome\nQuantidade anterior: $quantidadeAnterior\nNova quantidade: $novaQuantidade');
  }

  Future<void> excluirProduto(int id, String nome) async {
    final db = await banco;
    await db.delete(
      'produtos',
      where: 'id = ?',
      whereArgs: [id],
    );
    print('DELETE → Produto excluído: $nome');
  }

  Future<void> mostrarProdutosNoTerminal() async {
    final db = await banco;
    final produtos = await db.query('produtos');
    print('===== PRODUTOS NO BANCO =====');
    for (final produto in produtos) {
      print(produto);
    }
  }
}
