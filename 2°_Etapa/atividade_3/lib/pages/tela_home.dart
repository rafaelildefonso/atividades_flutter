import 'package:atividade_3/pages/tela_ajuda.dart';
import 'package:atividade_3/pages/tela_config.dart';
import 'package:atividade_3/pages/tela_favoritos.dart';
import 'package:atividade_3/pages/tela_perfil.dart';
import 'package:flutter/material.dart';
import 'package:atividade_3/widgets/card_icone.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  String botaoClicado = "Nada foi clicado";

  void atualizarMensagem(String texto) {
    setState(() {
      botaoClicado = "Você clicou em $texto";
    });
  }

  void mostrarMensagem(String texto) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.white,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(texto,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        child: const Text('Fechar'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atividade 3"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Expanded(
        child: ListView(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   mainAxisSize: MainAxisSize.max,
            //   children: [
            //     Text(botaoClicado),
            //   ],
            // ),
            CardIcone(
              icone: Icons.person,
              titulo: "Perfil",
              descricao: "Edite seu perfil",
              textoBotao: "Editar",
              cor: Colors.blue,
              aoClique: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TelaPerfil())),
            ),
            CardIcone(
              icone: Icons.settings,
              titulo: "Configurações",
              descricao: "Configure seu app",
              textoBotao: "Configurar",
              cor: Colors.red,
              aoClique: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TelaConfig())),
            ),
            CardIcone(
              icone: Icons.star,
              titulo: "Favoritos",
              descricao: "Ver seu favoritos",
              textoBotao: "Saber mais",
              cor: Colors.black,
              aoClique: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TelaFavoritos())),
            ),
            CardIcone(
              icone: Icons.question_answer,
              titulo: "Ajuda",
              descricao: "Precisa de ajuda?",
              textoBotao: "Clique aqui",
              cor: Colors.deepPurple,
              aoClique: () => mostrarMensagem("Ajuda"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("Rafael Ildefonso Furtado"),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () => atualizarMensagem("Elevated button")),
    );
  }
}
