import 'package:flutter/material.dart';

class TelaConfig extends StatefulWidget {
  const TelaConfig({super.key});

  @override
  State<TelaConfig> createState() => _TelaConfigState();
}

class _TelaConfigState extends State<TelaConfig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuração"),
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back)),
      ),
      body: Expanded(
        child: ListView(
          children: [
            ListTile(
              title: Text("Definir nome"),
              leading: Icon(Icons.person),
            ),
            Divider(),
            ListTile(
              title: Text("Definir idade"),
              leading: Icon(Icons.cake),
            ),
            Divider(),
            ListTile(
              title: Text("Definir profissão"),
              leading: Icon(Icons.work),
            ),
          ],
        ),
      ),
    );
  }
}
