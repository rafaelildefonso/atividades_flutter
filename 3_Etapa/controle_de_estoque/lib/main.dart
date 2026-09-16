import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:sqflite/sqflite.dart';
import 'providers/usuario_provider.dart';
import 'providers/produto_provider.dart';
import 'pages/login_page.dart';
import 'pages/cadastro_page.dart';
import 'pages/home_page.dart';
import 'pages/cadastro_produto_page.dart';
import 'pages/estoque_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  databaseFactory = databaseFactoryFfiWeb;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioProvider()),
        ChangeNotifierProvider(create: (_) => ProdutoProvider()),
      ],
      child: MaterialApp(
        title: 'Controle de Estoque',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginPage(),
          '/cadastro': (context) => const CadastroPage(),
          '/home': (context) => const HomePage(),
          '/cadastro_produto': (context) => const CadastroProdutoPage(),
          '/estoque': (context) => const EstoquePage(),
        },
      ),
    );
  }
}
