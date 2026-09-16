import 'package:flutter/material.dart';
import '../models/produto.dart';
import '../services/produto_service.dart';

class ProdutoProvider extends ChangeNotifier {
  final ProdutoService _service = ProdutoService();
  List<Produto> _produtos = [];

  List<Produto> get produtos => _produtos;

  Future<void> carregarProdutos() async {
    _produtos = await _service.listarProdutos();
    notifyListeners();
  }

  Future<void> cadastrarProduto(String nome, String categoria, int quantidade, double preco) async {
    final produto = Produto(nome: nome, categoria: categoria, quantidade: quantidade, preco: preco);
    await _service.cadastrarProduto(produto);
    await carregarProdutos();
  }

  Future<void> incrementarQuantidade(Produto produto) async {
    final novaQuantidade = produto.quantidade + 1;
    await _service.atualizarQuantidade(produto.id!, produto.nome, produto.quantidade, novaQuantidade);
    await carregarProdutos();
  }

  Future<void> decrementarQuantidade(Produto produto) async {
    final novaQuantidade = produto.quantidade - 1;
    await _service.atualizarQuantidade(produto.id!, produto.nome, produto.quantidade, novaQuantidade);
    await carregarProdutos();
  }

  Future<void> excluirProduto(Produto produto) async {
    await _service.excluirProduto(produto.id!, produto.nome);
    await carregarProdutos();
  }

  Future<void> mostrarProdutosNoTerminal() async {
    await _service.mostrarProdutosNoTerminal();
  }
}
