// TODO: Tela de pedido (StatefulWidget)
// Deve conter:
//   1. Um contador "Pedidos enviados: 0" (que aumenta com setState)
//   2. TextField para nome do cliente (com TextEditingController)
//   3. TextField para nome do produto desejado (com TextEditingController)
//   4. TextField para observação do pedido (com TextEditingController)
//   5. Botão "Enviar Pedido"
//   6. Validação ao clicar em Enviar Pedido:
//      - Se nome ou produto vazios -> SnackBar de erro
//      - Se preenchidos -> SnackBar de sucesso + incrementa contador

import 'package:flutter/material.dart';

void _enviarPedido(BuildContext context) {
  // TODO: validar se nome e produto estão preenchidos
  // Exemplo de SnackBar de erro:
  // ScaffoldMessenger.of(context).showSnackBar(
  //   const SnackBar(
  //     content: Text('Preencha o nome e o produto!'),
  //     backgroundColor: Colors.red,
  //   ),
  // );

  // Exemplo de SnackBar de sucesso:
  // ScaffoldMessenger.of(context).showSnackBar(
  //   const SnackBar(
  //     content: Text('Pedido enviado com sucesso!'),
  //     backgroundColor: Colors.green,
  //   ),
  // );
}
