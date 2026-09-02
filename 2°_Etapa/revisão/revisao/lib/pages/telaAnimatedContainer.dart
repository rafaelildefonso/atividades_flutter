import 'package:flutter/material.dart';
import 'dart:async';

class TelaAnimatedContainer extends StatefulWidget {
  const TelaAnimatedContainer({super.key});

  @override
  State<TelaAnimatedContainer> createState() => _TelaAnimatedContainerState();
}

class _TelaAnimatedContainerState extends State<TelaAnimatedContainer> {
  bool expandido = false;
  bool loop = false;

  void iniciarLoop() async {
    final temposDeEspera = [4, 5, 4];
    int index = 0;
    // Executa a função a cada 2 segundos
    loop = true;
    while (loop) {
      if (index == 2) {
        expandirContainer(false); // Expire
      } else {
        expandirContainer(true); // Inspire ou Hold
      }

      await Future.delayed(Duration(seconds: temposDeEspera[index]));

      index = (index + 1) % 3;
    }
  }

  void pararLoop() {
    // Sempre cancele o timer para evitar vazamento de memória
    loop = false;
  }

  void expandirContainer(bool condicao) {
    setState(() {
      expandido = condicao;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Animated Container",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Clique no card para animar tamanho, cor e borda",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    loop ? pararLoop() : iniciarLoop();
                  },
                  child: Text("Começar/parar")),
              InkWell(
                onTap: () {
                  expandirContainer(!expandido);
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: expandido ? 300 : 130,
                  height: expandido ? 300 : 130,
                  decoration: BoxDecoration(
                      color: expandido ? Colors.blue : Colors.yellow,
                      borderRadius:
                          BorderRadius.circular(expandido ? 150 : 10)),
                  child: Expanded(
                    child: Center(
                      child: Text(
                        expandido ? "Inspire" : "Expire",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
