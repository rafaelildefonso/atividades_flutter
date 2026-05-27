import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController input = TextEditingController();

    void printar() {
      print(input.text);
    }

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Perguntas"),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            children: [
              Image.network(""),
              Text("Quantos anos você tem?"),
              TextField(
                controller: input,
                decoration: InputDecoration(hintText: "Ex: 16 anos"),
              ),
              ElevatedButton(
                  onPressed: printar,
                  child: Text("Clique aqui 1")),
              ElevatedButton(
                  onPressed: () {
                    print(input.text);
                  },
                  child: Text("Clique aqui 2")),
              ElevatedButton(
                  onPressed: () => print(input.text),
                  child: Text("Clique aqui 3")),
            ],
          ),
        ),
      ),
    ));
  }
}
