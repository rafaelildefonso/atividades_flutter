import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: ""),
                ),
                GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 4,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                          print("1");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text('1',style:TextStyle(fontSize: 40)),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          print("1");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text('2',style:TextStyle(fontSize: 40)),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          print("1");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text('3',style:TextStyle(fontSize: 40)),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          print("1");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text('÷',style:TextStyle(fontSize: 40)),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          print("1");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text('4',style:TextStyle(fontSize: 40)),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          print("1");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text('5',style:TextStyle(fontSize: 40)),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          print("1");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text('6',style:TextStyle(fontSize: 40)),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          print("1");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text('x',style:TextStyle(fontSize: 40)),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          print("1");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text('7',style:TextStyle(fontSize: 40)),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          print("1");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text('8',style:TextStyle(fontSize: 40)),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          print("1");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text('9',style:TextStyle(fontSize: 40)),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          print("1");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text('+',style:TextStyle(fontSize: 40)),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          print("1");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text('0',style:TextStyle(fontSize: 40)),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          print("1");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text('.',style:TextStyle(fontSize: 40)),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          print("1");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text(',',style:TextStyle(fontSize: 40)),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          print("1");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text('-',style:TextStyle(fontSize: 40)),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
