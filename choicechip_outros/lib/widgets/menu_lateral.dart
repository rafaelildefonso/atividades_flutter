import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  final String paginaAtual;
  final VoidCallback onPersonalizar;
  final VoidCallback onResumo;
  final VoidCallback onSobre;

  const MenuLateral({
    super.key,
    required this.paginaAtual,
    required this.onPersonalizar,
    required this.onResumo,
    required this.onSobre,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 38,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Igor Braz',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Personalizador de perfil',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            selected: paginaAtual == 'personalizar',
            leading: const Icon(Icons.tune),
            title: const Text('Personalizar perfil'),
            onTap: onPersonalizar,
          ),
          ListTile(
            selected: paginaAtual == 'resumo',
            leading: const Icon(Icons.assignment),
            title: const Text('Resumo do perfil'),
            onTap: onResumo,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Sobre'),
            onTap: onSobre,
          ),
        ],
      ),
    );
  }
}
