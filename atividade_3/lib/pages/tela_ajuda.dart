import 'package:flutter/material.dart';

class TelaAjuda extends StatefulWidget {
  const TelaAjuda({super.key});

  @override
  State<TelaAjuda> createState() => _TelaAjudaState();
}

class _TelaAjudaState extends State<TelaAjuda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajuda"),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back)),
      ),
      body: Expanded(
        child: ListView(
          children: [
            ListTile(
              title: Text("Minha tela travou"),
              leading: Icon(Icons.question_mark),
            ),
            ListTile(
              title: Text("Não está abrindo alguma página"),
              leading: Icon(Icons.question_mark),
            ),
            ListTile(
              title: Text("Minha mãe não sabe usar o app"),
              leading: Icon(Icons.question_mark),
            ),
          ],
        ),
      ),
    );
  }
}
