import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController email = TextEditingController();
  final TextEditingController senha = TextEditingController();

  void _validarLogin() {
    if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email.text) &&
        senha.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green.withAlpha(200),
          content: Text('Login realizado com sucesso!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red.withAlpha(200),
          content: Text('Digite um e-mail e senha válido!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(200.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent.withAlpha(100),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Form(
                child: ListView(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 35),
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
                          hintText: "email@email.com",
                          labelText: "Digite sua senha",
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(minimumSize: Size(0, 60)),
                        onPressed: () {
                          _validarLogin();
                        },
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 19),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
