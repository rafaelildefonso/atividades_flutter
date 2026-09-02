import 'package:atividade_4/pages/home_page.dart';
import 'package:atividade_4/pages/register_page.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController email = TextEditingController();
  final TextEditingController senha = TextEditingController();
  String mensagemErro = '';

  void _validarLogin() {
    setState(() {
      if (email.text.isEmpty) {
        mensagemErro = "Digite seu email";
      } else if (!email.text.contains('@')) {
        mensagemErro = "Digite um email válido";
      } else if (senha.text.isEmpty) {
        mensagemErro = "Digite sua senha";
      } else {
        mensagemErro = '';
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const TelaHome()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withAlpha(20),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.lock, size: 64, color: Colors.blueAccent),
              SizedBox(height: 16),
              Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
              ),
              SizedBox(height: 8),
              Text(
                "Faça login para acessar sua conta",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 24),
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: "Digite seu email",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: senha,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: "Digite sua senha",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              if (mensagemErro.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    mensagemErro,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: _validarLogin,
                  child: Text(
                    "Entrar",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaCadastro(),
                    ),
                  );
                },
                child: Text("Criar conta"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
