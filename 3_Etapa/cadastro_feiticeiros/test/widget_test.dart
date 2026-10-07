import 'package:flutter_test/flutter_test.dart';

import 'package:cadastro_feiticeiros/models/missao.dart';

void main() {
  test('Missao deve converter para e a partir de um Map', () {
    final missao = Missao(
      id: '',
      titulo: 'Investigar maldição na escola',
      grau: 2,
      concluida: false,
      usuarioId: 'ABC123',
    );

    final dados = missao.toMap();

    expect(dados['titulo'], 'Investigar maldição na escola');
    expect(dados['grau'], 2);
    expect(dados['concluida'], false);
    expect(dados['usuarioId'], 'ABC123');

    final missaoRecuperada = Missao.fromMap('id1', dados);

    expect(missaoRecuperada.titulo, missao.titulo);
    expect(missaoRecuperada.grau, missao.grau);
    expect(missaoRecuperada.concluida, missao.concluida);
    expect(missaoRecuperada.usuarioId, missao.usuarioId);
  });

  test('Missao deve iniciar como não concluída', () {
    final missao = Missao(
      id: '',
      titulo: 'Proteger escola',
      grau: 1,
      concluida: false,
      usuarioId: 'XYZ999',
    );

    expect(missao.concluida, false);
  });
}
