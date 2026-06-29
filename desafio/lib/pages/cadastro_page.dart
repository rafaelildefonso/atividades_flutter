import 'package:desafio/pages/home_page.dart';
import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController email = TextEditingController();
  final TextEditingController senha = TextEditingController();

  void _validarCadastro() {
    if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email.text) &&
        senha.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green.withAlpha(200),
          content: Text('Login realizado com sucesso!')));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => TelaHome()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red.withAlpha(200),
          content: Text('Digite um e-mail e senha válido!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withAlpha(20),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Form(
            child: ListView(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 35),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: "email@email.com",
                      labelText: "Digite seu email",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: senha,
                  obscureText: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: "123",
                      labelText: "Digite sua senha",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(0, 60),
                        backgroundColor: Colors.blueAccent),
                    onPressed: () {
                      _validarCadastro();
                    },
                    child: Text(
                      "Cadastrar",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                          color: Colors.white),
                    )),
                TextButton(onPressed: () {
                  Navigator.push(
          context, MaterialPageRoute(builder: (context) => TelaHome()));
                }, child: Text("Fazer login"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
