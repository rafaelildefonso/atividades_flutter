import 'package:flutter/material.dart';
import 'dart:async';

class TelaTween extends StatefulWidget {
  const TelaTween({super.key});

  @override
  State<TelaTween> createState() => _TelaTweenState();
}

class _TelaTweenState extends State<TelaTween> {
  double tamanhoFinal = 120;

  void alterarTamanho() {
    setState(() {
      tamanhoFinal = tamanhoFinal == 120 ? 260 : 120;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tween"),
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
                "Alterar tamanho com Tween",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Tween define um valor inicial e um valor final. O Flutter calcula os valores intermediários automaticamente.",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: alterarTamanho,
                  child: Text("Alterar tamanho com tween")),
              SizedBox(
                height: 30,
              ),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 120, end: tamanhoFinal),
                duration: Duration(seconds: 1),
                builder: (context, valor, child) {
                  return Container(
                    width: valor,
                    height: valor,
                    decoration: BoxDecoration(
                        color: Colors.red,
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
