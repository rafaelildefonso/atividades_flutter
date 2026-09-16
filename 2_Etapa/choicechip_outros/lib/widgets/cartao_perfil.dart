import 'package:flutter/material.dart';

class CartaoPerfil extends StatelessWidget {
  final String nome;
  final String profissao;
  final String localizacao;
  final double tamanhoNome;
  final bool mostrarFoto;
  final bool mostrarDescricao;
  final bool mostrarLocalizacao;
  final Color corCartao;
  final double bordaCartao;

  const CartaoPerfil({
    super.key,
    required this.nome,
    required this.profissao,
    required this.localizacao,
    required this.tamanhoNome,
    required this.mostrarFoto,
    required this.mostrarDescricao,
    required this.mostrarLocalizacao,
    required this.corCartao,
    required this.bordaCartao,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: corCartao,
        borderRadius: BorderRadius.circular(bordaCartao),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          if (mostrarFoto)
            const CircleAvatar(
              radius: 45,
              child: Icon(
                Icons.person,
                size: 55,
              ),
            ),
          if (mostrarFoto) const SizedBox(height: 12),
          Text(
            nome,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: tamanhoNome,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (mostrarDescricao) ...[
            const SizedBox(height: 6),
            Text(
              profissao,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
          if (mostrarLocalizacao) ...[
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on,
                  size: 18,
                  color: Colors.grey,
                ),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    localizacao,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
