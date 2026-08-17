import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:menu_sanduiche/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Widget buildApp() => const MaterialApp(home: TelaInicio());

  testWidgets('Tela inicial renderiza corretamente', (tester) async {
    await tester.pumpWidget(buildApp());

    expect(find.text('Game Explorer'), findsOneWidget);
    expect(find.text('Bem-vindo ao Game Explorer'), findsOneWidget);
    expect(find.text('Explorar'), findsOneWidget);
    expect(find.byIcon(Icons.sports_esports), findsOneWidget);
  });

  testWidgets('Menu sanduíche abre com cabeçalho e opções', (tester) async {
    await tester.pumpWidget(buildApp());

    expect(find.byIcon(Icons.menu), findsOneWidget);
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    expect(find.text('Game Explorer'), findsNWidgets(2));
    expect(find.text('Explore seu mundo de jogos!'), findsOneWidget);
    expect(find.widgetWithText(ListTile, 'Início'), findsOneWidget);
    expect(find.widgetWithText(ListTile, 'Perfil'), findsOneWidget);
    expect(find.widgetWithText(ListTile, 'Favoritos'), findsOneWidget);
    expect(find.widgetWithText(ListTile, 'Conquistas'), findsOneWidget);
    expect(find.widgetWithText(ListTile, 'Configurações'), findsOneWidget);
  });

  testWidgets('Navega para Perfil e retorna ao Início', (tester) async {
    await tester.pumpWidget(buildApp());

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(ListTile, 'Perfil'));
    await tester.pumpAndSettle();

    expect(find.text('JogadorExplorer'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(ListTile, 'Início'));
    await tester.pumpAndSettle();

    expect(find.text('Bem-vindo ao Game Explorer'), findsOneWidget);
  });

  testWidgets('Navega para Favoritos e abre os detalhes', (tester) async {
    await tester.pumpWidget(buildApp());

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(ListTile, 'Favoritos'));
    await tester.pumpAndSettle();

    expect(find.text('Minecraft'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.visibility).first);
    await tester.pumpAndSettle();

    expect(find.textContaining('Categoria: Aventura'), findsOneWidget);

    await tester.tap(find.text('Fechar'));
    await tester.pumpAndSettle();
    expect(find.text('Minecraft'), findsOneWidget);
  });

  testWidgets('App funciona dentro do DevicePreview', (tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(DevicePreview(builder: (_) => const MeuApp()));
    await tester.pumpAndSettle();

    expect(find.text('Bem-vindo ao Game Explorer'), findsOneWidget);
  });
}
