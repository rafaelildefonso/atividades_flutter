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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(botaoClicado),
              ],
            ),
            CardIcone(
              icone: Icons.person,
              titulo: "Perfil",
              descricao: "Edite seu perfil",
              textoBotao: "Editar",
              cor: Colors.blue,
              aoClique: () => atualizarMensagem("Perfil"),
            ),
            CardIcone(
              icone: Icons.settings,
              titulo: "Configurações",
              descricao: "Configure seu app",
              textoBotao: "Configurar",
              cor: Colors.red,
              aoClique: () => atualizarMensagem("Configurações"),
            ),
            CardIcone(
              icone: Icons.star,
              titulo: "Favoritos",
              descricao: "Ver seu favoritos",
              textoBotao: "Saber mais",
              cor: Colors.black,
              aoClique: () => atualizarMensagem("Favoritos"),
            ),
            CardIcone(
              icone: Icons.question_answer,
              titulo: "Ajuda",
              descricao: "Precisa de ajuda?",
              textoBotao: "Clique aqui",
              cor: Colors.deepPurple,
              aoClique: () => atualizarMensagem("Ajuda"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("Rafael Ildefonso Furtado "),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => atualizarMensagem("Elevated button")),
    );
  }
}
