import 'package:flutter/material.dart';

class TelaCadastroObjeto extends StatefulWidget {
  const TelaCadastroObjeto({super.key});

  @override
  State<TelaCadastroObjeto> createState() => _TelaCadastroObjetoState();
}

class _TelaCadastroObjetoState extends State<TelaCadastroObjeto> {
  TextEditingController nomeObjeto = TextEditingController();
  TextEditingController localObjeto = TextEditingController();
  int quantidadeObjetos = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Achados e Perdidos"),
      ),
      body: Column(
        spacing: 10,
        children: [
          TextField(
            controller: nomeObjeto,
            decoration: InputDecoration(hintText: "Nome do objeto"),
          ),
          TextField(
            controller: localObjeto,
            decoration:
                InputDecoration(hintText: "Local onde o objeto foi encontrado"),
          ),
          Icon(
            Icons.search,
            size: 30,
          ),
          ElevatedButton(
            onPressed: () {
              if (nomeObjeto.text.isNotEmpty && localObjeto.text.isNotEmpty) {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirmação'),
                      content: Text(
                          "Deseja realmente registrar o objeto?\n${nomeObjeto.text}\n${localObjeto.text}"),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Cancelar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Confirmar'),
                          onPressed: () {
                            Navigator.of(context).pop();

                            setState(() {
                              quantidadeObjetos++;
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Registro feito com sucesso.'),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Preencha todas as informações.'),
                  ),
                );
              }
            },
            child: const Text("Registrar objeto"),
          ),
          Text("Quantidade total de registros realizados: $quantidadeObjetos"),
        ],
      ),
    );
  }
}
