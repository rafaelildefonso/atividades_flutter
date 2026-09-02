import 'package:flutter/material.dart';
import 'package:revisao/pages/tela_detalhes.dart';

class TelaPageRoute extends StatelessWidget {
  const TelaPageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageRoute'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.open_in_new,
                  size: 80,
                  color: Colors.purple,
                ),
                const SizedBox(height: 20),
                const Text(
                  'PageRouteBuilder',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Permite personalizar a animação de abertura de uma nova tela.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const TelaDestinoPageRoute();
                          }, transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                      begin: const Offset(1, 0),
                                      end: Offset.zero)
                                  .animate(animation),
                              child: child,
                            );
                          }));
                    },
                    child: Text("Abrir tela com animação slide")),
                const SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const TelaDestinoPageRoute();
                          }, transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          }));
                    },
                    child: Text("Abrir tela com animação fade")),
                const SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const TelaDestinoPageRoute();
                          }, transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return ScaleTransition(
                              alignment: Alignment(1, -1),
                              scale: animation,
                              child: child,
                            );
                          }));
                    },
                    child: Text("Abrir tela com animação scale")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TelaDestinoPageRoute extends StatelessWidget {
  const TelaDestinoPageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TelaDestinoPageRoute'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.open_in_new,
                  size: 80,
                  color: Colors.purple,
                ),
                const SizedBox(height: 20),
                const Text(
                  'TelaDestinoPageRoute',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Você chegou à outra tela.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                          context,
                          PageRouteBuilder(pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const TelaDetalhes();
                          }, transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                      begin: const Offset(1, 0),
                                      end: Offset.zero)
                                  .animate(animation),
                              child: child,
                            );
                          }));
                    },
                    child: Text("Voltar"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
