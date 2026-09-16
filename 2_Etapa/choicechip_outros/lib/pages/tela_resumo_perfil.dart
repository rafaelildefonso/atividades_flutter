import 'package:flutter/material.dart';

import '../widgets/cartao_perfil.dart';
import '../widgets/menu_lateral.dart';

class TelaResumoPerfil extends StatelessWidget {
  final String nome;
  final String profissao;
  final String localizacao;
  final String estiloSelecionado;
  final double tamanhoNome;
  final bool mostrarFoto;
  final bool mostrarDescricao;
  final bool mostrarLocalizacao;

  const TelaResumoPerfil({
    super.key,
    required this.nome,
    required this.profissao,
    required this.localizacao,
    required this.estiloSelecionado,
    required this.tamanhoNome,
    required this.mostrarFoto,
    required this.mostrarDescricao,
    required this.mostrarLocalizacao,
  });

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

  double get progresso {
    return quantidadeOpcoesAtivas / 3;
  }

  void abrirSobre(BuildContext context) {
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

  void voltarParaInicio(BuildContext context) {
    Navigator.of(context).popUntil((rota) => rota.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Resumo do perfil'),
        centerTitle: true,
      ),
      drawer: MenuLateral(
        paginaAtual: 'resumo',
        onPersonalizar: () {
          Navigator.pop(context);
          voltarParaInicio(context);
        },
        onResumo: () {
          Navigator.pop(context);
        },
        onSobre: () {
          Navigator.pop(context);
          abrirSobre(context);
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CartaoPerfil(
              nome: nome,
              profissao: profissao,
              localizacao: localizacao,
              tamanhoNome: tamanhoNome,
              mostrarFoto: mostrarFoto,
              mostrarDescricao: mostrarDescricao,
              mostrarLocalizacao: mostrarLocalizacao,
              corCartao: corCartao,
              bordaCartao: bordaCartao,
            ),
            const SizedBox(height: 25),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Configuração do perfil',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$quantidadeOpcoesAtivas de 3 opções visuais estão ativas.',
                    ),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      value: progresso,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(
                      label: Text('Configuração'),
                    ),
                    DataColumn(
                      label: Text('Valor'),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        const DataCell(Text('Estilo')),
                        DataCell(Text(estiloSelecionado)),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text('Tamanho do nome')),
                        DataCell(Text(tamanhoNome.toInt().toString())),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text('Mostrar foto')),
                        DataCell(Text(mostrarFoto ? 'Sim' : 'Não')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text('Mostrar descrição')),
                        DataCell(Text(mostrarDescricao ? 'Sim' : 'Não')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text('Mostrar localização')),
                        DataCell(Text(mostrarLocalizacao ? 'Sim' : 'Não')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.edit),
                label: const Text('Voltar e editar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
