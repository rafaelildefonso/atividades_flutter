import 'package:flutter/material.dart';

class CardIcone extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String descricao;
  final String textoBotao;
  final Color cor;
  final VoidCallback aoClique;


  const CardIcone(
      {super.key,
      required this.icone,
      required this.titulo,
      required this.descricao,
      required this.textoBotao,
      required this.cor,
      required this.aoClique});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: cor.withAlpha(100), borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icone,color: cor,),
                    SizedBox(
                  width: 8,
                ),
                    Text(
                      titulo,
                      style: TextStyle(color: cor, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(descricao),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: cor,
                        ),
                    onPressed: aoClique,
                    child: Text(textoBotao, style: TextStyle(color: Colors.white)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
