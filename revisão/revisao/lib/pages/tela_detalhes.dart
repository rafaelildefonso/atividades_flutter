import 'package:flutter/material.dart';
import 'package:revisao/pages/telaAnimatedContainer.dart';
import 'package:revisao/pages/telaAnimatedController.dart';
import 'package:revisao/pages/telaAnimatedOpacity.dart';
import 'package:revisao/pages/telaPageRoute.dart';
import 'package:revisao/pages/telaTween.dart';

class TelaDetalhes extends StatelessWidget {
  const TelaDetalhes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animação'),
      ),
      //por padrao o navegator.push nos dar um voltar se estiver no appbar

      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(
                Icons.school,
                size: 80,
                color: Colors.yellow,
              ),
              SizedBox(height: 20),
              Text(
                "Animação explicita e implicita",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Escolha um tipo de animação",
                textAlign: TextAlign.center,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaAnimatedContainer(),
                    ),
                  );
                },
                icon: Icon(Icons.animation),
                label: Text("AnimatedContainer"),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const TelaPageRoute();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.open_in_new),
                label: const Text('PageRoute'),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const TelaAnimatedOpacity();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.visibility),
                label: const Text('TelaAnimatedOpacity'),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const TelaTween();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.animation),
                label: const Text('Tween'),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const TelaAnimatedController();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.control_camera),
                label: const Text('AnimatedController'),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
