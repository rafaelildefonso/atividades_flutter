import 'package:flutter/material.dart';

import '../widgets/cartao_perfil.dart';
import '../widgets/menu_lateral.dart';
import '../widgets/titulo_secao.dart';
import 'tela_resumo_perfil.dart';

class TelaPersonalizarPerfil extends StatefulWidget {
  const TelaPersonalizarPerfil({super.key});

  @override
  State<TelaPersonalizarPerfil> createState() {
    return _TelaPersonalizarPerfilState();
  }
}

class _TelaPersonalizarPerfilState
    extends State<TelaPersonalizarPerfil> {
  String estiloSelecionado = 'Clássico';
  double tamanhoNome = 24;
  bool mostrarFoto = true;
  bool mostrarDescricao = true;
  bool mostrarLocalizacao = true;

  final List<String> estilos = [
    'Clássico',
    'Moderno',
    'Colorido',
  ];

  Color get corCartao {
    if (estiloSelecionado == 'Moderno') {
      return Colors.blueGrey.shade100;
    }

    if (estiloSelecionado == 'Colorido') {
      return Colors.deepPurple.shade100;
    }

    return Colors.white;
  }

  double get bordaCartao {
    if (estiloSelecionado == 'Moderno') {
      return 5;
    }

    if (estiloSelecionado == 'Colorido') {
      return 35;
    }

    return 18;
  }

  int get quantidadeOpcoesAtivas {
    int quantidade = 0;

    if (mostrarFoto) {
      quantidade++;
    }

    if (mostrarDescricao) {
      quantidade++;
    }

    if (mostrarLocalizacao) {
      quantidade++;
    }

    return quantidade;
  }

  void salvarPerfil() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Perfil salvo no estilo $estiloSelecionado!',
        ),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Fechar',
          onPressed: () {},
        ),
      ),
    );
  }

  void abrirResumo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return TelaResumoPerfil(
            nome: 'Igor Braz',
            profissao: 'Desenvolvedor Flutter',
            localizacao: 'Belo Horizonte, MG',
            estiloSelecionado: estiloSelecionado,
            tamanhoNome: tamanhoNome,
            mostrarFoto: mostrarFoto,
            mostrarDescricao: mostrarDescricao,
            mostrarLocalizacao: mostrarLocalizacao,
          );
        },
      ),
    );
  }

  void abrirSobre() {
    showAboutDialog(
      context: context,
      applicationName: 'Personalizador de Perfil',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(
        Icons.widgets,
        size: 45,
      ),
      children: const [
        Text(
          'Aplicativo desenvolvido para estudar widgets, estados e navegação no Flutter.',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Personalizar perfil'),
        centerTitle: true,
      ),
      drawer: MenuLateral(
        paginaAtual: 'personalizar',
        onPersonalizar: () {
          Navigator.pop(context);
        },
        onResumo: () {
          Navigator.pop(context);
          abrirResumo();
        },
        onSobre: () {
          Navigator.pop(context);
          abrirSobre();
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CartaoPerfil(
              nome: 'Igor Braz',
              profissao: 'Desenvolvedor Flutter',
              localizacao: 'Belo Horizonte, MG',
              tamanhoNome: tamanhoNome,
              mostrarFoto: mostrarFoto,
              mostrarDescricao: mostrarDescricao,
              mostrarLocalizacao: mostrarLocalizacao,
              corCartao: corCartao,
              bordaCartao: bordaCartao,
            ),
            const SizedBox(height: 30),
            const TituloSecao(
              titulo: 'Estilo do cartão',
              descricao: 'Selecione uma opção',
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: estilos.map((estilo) {
                return ChoiceChip(
                  label: Text(estilo),
                  selected: estiloSelecionado == estilo,
                  onSelected: (selecionado) {
                    if (selecionado) {
                      setState(() {
                        estiloSelecionado = estilo;
                      });
                    }
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            TituloSecao(
              titulo: 'Tamanho do nome',
              descricao: '${tamanhoNome.toInt()} pixels',
            ),
            Slider(
              value: tamanhoNome,
              min: 16,
              max: 36,
              divisions: 10,
              label: tamanhoNome.toInt().toString(),
              onChanged: (novoValor) {
                setState(() {
                  tamanhoNome = novoValor;
                });
              },
            ),
            const SizedBox(height: 20),
            const TituloSecao(
              titulo: 'Elementos visíveis',
              descricao: 'Ative ou desative as opções',
            ),
            const SizedBox(height: 10),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('Mostrar foto'),
                    subtitle: const Text(
                      'Exibe ou esconde a foto do perfil',
                    ),
                    secondary: const Icon(Icons.account_circle),
                    value: mostrarFoto,
                    onChanged: (novoValor) {
                      setState(() {
                        mostrarFoto = novoValor;
                      });
                    },
                  ),
                  const Divider(height: 1),
                  SwitchListTile(
                    title: const Text('Mostrar descrição'),
                    subtitle: const Text(
                      'Exibe a profissão no cartão',
                    ),
                    secondary: const Icon(Icons.description),
                    value: mostrarDescricao,
                    onChanged: (novoValor) {
                      setState(() {
                        mostrarDescricao = novoValor;
                      });
                    },
                  ),
                  const Divider(height: 1),
                  SwitchListTile(
                    title: const Text('Mostrar localização'),
                    subtitle: const Text(
                      'Exibe a cidade no cartão',
                    ),
                    secondary: const Icon(Icons.location_on),
                    value: mostrarLocalizacao,
                    onChanged: (novoValor) {
                      setState(() {
                        mostrarLocalizacao = novoValor;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Card(
              clipBehavior: Clip.antiAlias,
              child: ExpansionTile(
                leading: const Icon(Icons.settings),
                title: const Text('Configurações adicionais'),
                subtitle: const Text('Toque para abrir'),
                children: [
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('Idioma'),
                    subtitle: const Text('Português'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock),
                    title: const Text('Privacidade'),
                    subtitle: const Text('Perfil público'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.palette),
                    title: const Text('Tema'),
                    subtitle: Text(estiloSelecionado),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: salvarPerfil,
                icon: const Icon(Icons.save),
                label: const Text('Salvar perfil'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: abrirResumo,
                icon: const Icon(Icons.visibility),
                label: const Text('Visualizar resumo'),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: abrirResumo,
        icon: const Icon(Icons.arrow_forward),
        label: Text('$quantidadeOpcoesAtivas ativas'),
      ),
    );
  }
}
