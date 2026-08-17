import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MeuApp(),
    ),
  );
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Game Explorer',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const TelaInicio(),
    );
  }
}

class TelaInicio extends StatelessWidget {
  const TelaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Explorer'),
        centerTitle: true,
      ),
      drawer: const MenuLateral(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(
                Icons.sports_esports,
                size: 100,
              ),
              SizedBox(height: 16),
              Text(
                'Bem-vindo ao Game Explorer',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Explore jogos, descubra novas aventuras '
                'e organize seus conteúdos favoritos.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 30),
              CardJogo(
                icone: Icons.explore,
                titulo: 'Explorar',
                descricao:
                    'Descubra novos jogos, mundos e personagens.',
              ),
              SizedBox(height: 12),
              CardJogo(
                icone: Icons.favorite,
                titulo: 'Favoritos',
                descricao:
                    'Organize os jogos que você mais gosta.',
              ),
              SizedBox(height: 12),
              CardJogo(
                icone: Icons.emoji_events,
                titulo: 'Conquistas',
                descricao:
                    'Acompanhe seus desafios e recompensas.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardJogo extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String descricao;

  const CardJogo({
    super.key,
    required this.icone,
    required this.titulo,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Icon(
              icone,
              size: 50,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(descricao),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  void _abrirTela(BuildContext context, Widget tela) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => tela),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF4527A0), Color(0xFF7E57C2)],
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.white24,
                  child: Icon(
                    Icons.sports_esports,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Game Explorer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Explore seu mundo de jogos!',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Início'),
            onTap: () {
              Navigator.pop(context);
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () => _abrirTela(context, const TelaPerfil()),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favoritos'),
            onTap: () => _abrirTela(context, const TelaFavoritos()),
          ),
          ListTile(
            leading: const Icon(Icons.emoji_events),
            title: const Text('Conquistas'),
            onTap: () => _abrirTela(context, const TelaConquistas()),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () => _abrirTela(context, const TelaConfiguracoes()),
          ),
        ],
      ),
    );
  }
}

class TelaPerfil extends StatelessWidget {
  const TelaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      drawer: const MenuLateral(),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 48,
              backgroundColor: Color(0xFFD1C4E9),
              child: Icon(Icons.person, size: 56, color: Color(0xFF4A148C)),
            ),
            SizedBox(height: 16),
            Text(
              'JogadorExplorer',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'Explorador desde 2024',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: _Estatistica(
                    valor: '8.540',
                    rotulo: 'Pontuação',
                    icone: Icons.star,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _Estatistica(
                    valor: '12',
                    rotulo: 'Jogos concluídos',
                    icone: Icons.sports_esports,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _Estatistica(
                    valor: '27',
                    rotulo: 'Conquistas',
                    icone: Icons.emoji_events,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sobre mim',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Gamer apaixonado por aventuras e mundos abertos. '
                      'Sempre em busca do próximo desafio e das '
                      'conquistas mais raras.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Estatistica extends StatelessWidget {
  final String valor;
  final String rotulo;
  final IconData icone;

  const _Estatistica({
    required this.valor,
    required this.rotulo,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          children: [
            Icon(icone, size: 28),
            const SizedBox(height: 8),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                valor,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              rotulo,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class TelaFavoritos extends StatefulWidget {
  const TelaFavoritos({super.key});

  @override
  State<TelaFavoritos> createState() => _TelaFavoritosState();
}

class _TelaFavoritosState extends State<TelaFavoritos> {
  final List<Jogo> _jogos = const [
    Jogo('Zelda: Breath of the Wild', 'Aventura', Icons.landscape),
    Jogo('Minecraft', 'Sandbox', Icons.castle),
    Jogo('Mario Kart 8', 'Corrida', Icons.sports_motorsports),
    Jogo('Celeste', 'Plataforma', Icons.terrain),
  ];

  final Set<String> _favoritos = {
    'Zelda: Breath of the Wild',
    'Minecraft',
    'Mario Kart 8',
    'Celeste',
  };

  void _alternarFavorito(String nome) {
    setState(() {
      if (!_favoritos.remove(nome)) {
        _favoritos.add(nome);
      }
    });
  }

  void _verDetalhes(BuildContext context, Jogo jogo) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(jogo.icone),
            const SizedBox(width: 8),
            Expanded(child: Text(jogo.nome)),
          ],
        ),
        content: Text('Categoria: ${jogo.categoria}\n'
            'Um ótimo jogo para explorar no Game Explorer!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos')),
      drawer: const MenuLateral(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _jogos.length,
        itemBuilder: (context, index) {
          final jogo = _jogos[index];
          final ehFavorito = _favoritos.contains(jogo.nome);
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Icon(jogo.icone)),
              title: Text(jogo.nome),
              subtitle: Text(jogo.categoria),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      ehFavorito ? Icons.favorite : Icons.favorite_border,
                      color: ehFavorito ? Colors.red : null,
                    ),
                    onPressed: () => _alternarFavorito(jogo.nome),
                    tooltip: 'Favoritar',
                  ),
                  IconButton(
                    icon: const Icon(Icons.visibility),
                    onPressed: () => _verDetalhes(context, jogo),
                    tooltip: 'Ver detalhes',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Jogo {
  final String nome;
  final String categoria;
  final IconData icone;

  const Jogo(this.nome, this.categoria, this.icone);
}

class TelaConquistas extends StatelessWidget {
  const TelaConquistas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Conquistas')),
      drawer: const MenuLateral(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.emoji_events, color: Colors.amber),
              title: Text('Primeira Vitória'),
              subtitle: Text('Complete seu primeiro desafio.'),
              trailing: Icon(Icons.check_circle, color: Colors.green),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.military_tech, color: Colors.blueGrey),
              title: Text('Explorador Iniciante'),
              subtitle: Text('Visite 10 mundos diferentes.'),
              trailing: Icon(Icons.check_circle, color: Colors.green),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.star, color: Colors.orange),
              title: Text('Colecionador'),
              subtitle: Text('Reúna 50 itens raros.'),
              trailing: Icon(Icons.lock),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.sports_esports, color: Colors.purple),
              title: Text('Mestre dos Jogos'),
              subtitle: Text('Complete todos os jogos favoritos.'),
              trailing: Icon(Icons.lock),
            ),
          ),
        ],
      ),
    );
  }
}

class TelaConfiguracoes extends StatefulWidget {
  const TelaConfiguracoes({super.key});

  @override
  State<TelaConfiguracoes> createState() => _TelaConfiguracoesState();
}

class _TelaConfiguracoesState extends State<TelaConfiguracoes> {
  bool _notificacoes = true;
  bool _modoEscuro = false;
  bool _sincronizar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      drawer: const MenuLateral(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            secondary: const Icon(Icons.notifications),
            title: const Text('Notificações'),
            subtitle: const Text('Receba novidades dos seus jogos.'),
            value: _notificacoes,
            onChanged: (valor) => setState(() => _notificacoes = valor),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode),
            title: const Text('Modo escuro'),
            subtitle: const Text('Use o tema escuro do aplicativo.'),
            value: _modoEscuro,
            onChanged: (valor) => setState(() => _modoEscuro = valor),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.sync),
            title: const Text('Sincronização'),
            subtitle: const Text('Sincronize seu progresso na nuvem.'),
            value: _sincronizar,
            onChanged: (valor) => setState(() => _sincronizar = valor),
          ),
        ],
      ),

    );
  }
}
