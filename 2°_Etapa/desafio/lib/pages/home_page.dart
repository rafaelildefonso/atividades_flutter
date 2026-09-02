import 'package:desafio/pages/login_page.dart';
import 'package:flutter/material.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withAlpha(20),
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => TelaLogin()));
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
                size: 20,
              ))
        ],
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Parabéns, você está logado",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
      ),
    );
  }
}
