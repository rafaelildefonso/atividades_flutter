import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController nomeCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController senhaCtrl = TextEditingController();
  final TextEditingController confirmarSenhaCtrl = TextEditingController();
  String mensagem = '';

  void _validarCadastro() {
    setState(() {
      if (nomeCtrl.text.isEmpty) {
        mensagem = "Digite seu nome";
      } else if (emailCtrl.text.isEmpty) {
        mensagem = "Digite seu email";
      } else if (!emailCtrl.text.contains('@')) {
        mensagem = "Digite um email válido";
      } else if (senhaCtrl.text.isEmpty) {
        mensagem = "Digite sua senha";
      } else if (senhaCtrl.text.length < 6) {
        mensagem = "A senha precisa ter pelo menos 6 caracteres";
      } else if (confirmarSenhaCtrl.text != senhaCtrl.text) {
        mensagem = "As senhas não são iguais";
      } else {
        mensagem = "Cadastro realizado com sucesso!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      backgroundColor: Colors.grey.withAlpha(20),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.person_add, size: 64, color: Colors.blueAccent),
              SizedBox(height: 16),
              Text(
                "Criar Conta",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
              ),
              SizedBox(height: 24),
              TextFormField(
                controller: nomeCtrl,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: "Digite seu nome",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: emailCtrl,
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
                controller: senhaCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: "Digite sua senha",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: confirmarSenhaCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock_outline),
                  labelText: "Confirmar senha",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              if (mensagem.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                    mensagem,
                    style: TextStyle(
                      color: mensagem == "Cadastro realizado com sucesso!"
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: _validarCadastro,
                  child: Text(
                    "Cadastrar",
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
                  Navigator.pop(context);
                },
                child: Text("Voltar para Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
