import 'package:flutter/material.dart';
import './tela_detalhes.dart';

class TelaRevisao extends StatefulWidget {
  //A tela pode Mudar de estado
  const TelaRevisao({super.key});

  @override
  State<TelaRevisao> createState() => _TelaRevisaoState();
  //_TelaRevisaoState é onde fica os dados que podem mudar
}

class _TelaRevisaoState extends State<TelaRevisao> {
  String mensagem = 'Clique em uma opção'; //vai ser utilizada no setState

  @override
  Widget build(BuildContext context) {
    // é o metodo que monta a interface
    return Scaffold(
      //É o corpo da aplicação

      appBar: AppBar(
        //É header da nossa aplicação/cabeçalho
        title: const Text('Revisão Flutter'),
      ),

      body: SafeArea(
        //Proteger o conteudo de area notch(bordas, câmera )
        child: Padding(
          //cria espaço
          padding: const EdgeInsets.all(20),
          child: Column(
            //Organixza os widgets na vertical
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //children é só aceito em row e Column
              const Icon(
                //Icone com ligação com o google fonts
                Icons.phone_android,
                size: 80,
                color: Colors.blue,
              ),

              const SizedBox(height: 20),

              const Text(
                'Revisão de Flutter',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Vamos revisar widgets, layout, estilo, botões, estado e navegação.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),

              Container(
                //funciona como uma caixa para mexer no estilo
                width: 320, //limita largura
                padding: const EdgeInsets.all(16), //cria espaço
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'O Container funciona como uma caixa. Ele pode ter largura, padding, margin, cor e bordas.',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),

              Text(
                mensagem, //mensagem que a gende colocou na linha 13
                //quem muda o estado do componente é o parametro onpressed
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              Row(
                // componetes em uma linha
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        mensagem = 'Você clicou no botão Azul';
                      });
                    },
                    child: const Text('Azul'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      elevation: 4,
                    ),
                    onPressed: () {
                      setState(() {
                        mensagem = 'Você clicou no botão Destaque';
                      });
                    },
                    child: const Text('Destaque'),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              ElevatedButton.icon(
                //botao com um icone juntos
                onPressed: () {
                  Navigator.push(
                    //leva para outra tela
                    context,
                    MaterialPageRoute(
                      //faz a mudança de página
                      builder: (context) => const TelaDetalhes(),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Ir para detalhes'),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        //botão flutuante
        onPressed: () {
          // ação executada
          setState(() {
            //atualiza a variavel
            mensagem = 'Você clicou no botão flutuante';
          });
        },

        child: const Icon(Icons.add), //add icone "mais"
      ),
    );
  }
}
