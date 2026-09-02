import 'package:atividades_revisao/pages/horta/tela_relatorio.dart';
import 'package:flutter/material.dart';

class HortaInteligente extends StatefulWidget {
  const HortaInteligente({super.key});

  @override
  State<HortaInteligente> createState() => _HortaInteligenteState();
}

class _HortaInteligenteState extends State<HortaInteligente> {
  TextEditingController nomeplanta = TextEditingController();
  int nivelAgua = 50;
  String situacaoPlanta = "“A planta está bem cuidada.”";
  Color corPlanta = Colors.green;

  void diminuirAgua() {
    setState(() {
      if (nivelAgua != 0) {
        nivelAgua -= 10;
      }
    });
    classificarSituacao();
  }

  void aumentarAgua() {
    setState(() {
      if (nivelAgua != 100) {
        nivelAgua += 10;
      }
    });
    classificarSituacao();
  }

  void classificarSituacao() {
    setState(() {
      if (nivelAgua >= 0 && nivelAgua <= 30) {
        situacaoPlanta = "“A planta precisa de água.”";
        corPlanta = Colors.red;
      } else if (nivelAgua >= 40 && nivelAgua <= 70) {
        situacaoPlanta = "“A planta está bem cuidada.”";
        corPlanta = Colors.green;
      } else if (nivelAgua >= 80 && nivelAgua <= 100) {
        situacaoPlanta = "“Cuidado com o excesso de água.”";
        corPlanta = Colors.blue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Horta Inteligente"),
      ),
      body: Column(
        spacing: 10,
        children: [
          TextField(
            controller: nomeplanta,
            decoration: InputDecoration(hintText: "Nome da planta"),
          ),
          AnimatedContainer(
            width: 100,
            height: 100,
            color: corPlanta,
            duration: Duration(seconds: 1),
            child: Icon(
              Icons.local_florist,
              size: 30,
            ),
          ),
          Text("Nivel da agua: $nivelAgua%"),
          Text("Situação da planta: $situacaoPlanta"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: diminuirAgua, icon: Icon(Icons.remove)),
              IconButton(onPressed: aumentarAgua, icon: Icon(Icons.add)),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          children: [
                            Text('Não deixar a planta sem luz'),
                            Text('Evitar excesso de água'),
                            Text('Verificar a terra diariamente'),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text("Ver cuidados")),
              SizedBox(height: 5,),
          ElevatedButton(
              onPressed: () {
                if (nomeplanta.text.isNotEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TelaRelatorio(
                                nomePlanta: nomeplanta.text,
                                nivelAgua: nivelAgua,
                                situacaoPlanta: situacaoPlanta,
                              )));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Informe o nome da planta'),
                  ));
                }
              },
              child: Text("Ver relatório")),
        ],
      ),
    );
  }
}
