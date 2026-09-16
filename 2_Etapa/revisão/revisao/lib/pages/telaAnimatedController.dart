import 'package:flutter/material.dart';
import 'dart:async';

class TelaAnimatedController extends StatefulWidget {
  const TelaAnimatedController({super.key});

  @override
  State<TelaAnimatedController> createState() => _TelaAnimatedControllerState();
}

class _TelaAnimatedControllerState extends State<TelaAnimatedController>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> tamanho;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    tamanho = Tween<double>(begin: 100, end: 250).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void iniciarAnimacao() {
    controller.forward();
  }

  void voltarAnimacao() {
    controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Controller"),
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
                "Animated Controller",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Clique nos botões para controlar animação",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: iniciarAnimacao, child: Text("Começar animação")),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: voltarAnimacao, child: Text("Voltar animação")),
              SizedBox(
                height: 10,
              ),
              AnimatedBuilder(
                animation: tamanho,
                builder: (context, child) {
                  return Container(
                    width: tamanho.value,
                    height: tamanho.value,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Expanded(
                      child: Center(
                        child: Text(
                          "Quadrado",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
