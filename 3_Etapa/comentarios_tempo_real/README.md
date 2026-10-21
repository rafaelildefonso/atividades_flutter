# Comentários em Tempo Real

Continuação do aplicativo da aula do dia 19/10, agora com **comentários nas
publicações**, compartilhados entre contas diferentes e atualizados em tempo
real via Cloud Firestore.

## Funcionalidades

### Mantidas da aula do dia 19/10

- **Cadastro / Login** com Google (`firebase_auth` + `google_sign_in`).
- **Perfil** do usuário logado (foto, nome e e-mail) no cabeçalho.
- **Publicações (missões)**: criação, marcação como concluída e exclusão.
  O feed mostra as publicações de todos os usuários em tempo real (as mais
  recentes primeiro) e cada usuário só exclui as próprias.
- **Sair da conta**.

### Novas (esta atividade)

- **Botão de comentários** em cada publicação.
- **Tela de comentários** com a publicação selecionada e a lista de comentários.
- **Escrita e envio de comentários** em tempo real.
- **Comentários organizados por publicação**: cada comentário guarda o
  identificador da publicação (`missaoId`), então um comentário nunca aparece
  na discussão de outra publicação.
- **Exclusão apenas dos próprios comentários** — a interface esconde o botão
  de exclusão para os comentários de outras pessoas e as **regras de segurança
  do Firestore** (`firestore.rules`) bloqueiam a exclusão no servidor.

## Estrutura do projeto

```
lib/
├── main.dart                     # Inicialização do Firebase e verificação do login
├── firebase_options.dart         # Configurações geradas pelo FlutterFire CLI
├── models/
│   ├── missao.dart               # Publicação (missão)
│   └── comentario.dart           # Comentário (texto, nome, UID e id da publicação)
├── services/
│   ├── auth_service.dart         # Login com Google
│   ├── missao_service.dart       # Publicações em tempo real (snapshots)
│   └── comentario_service.dart   # Comentários em tempo real (snapshots)
└── pages/
    ├── login_page.dart           # Tela de login
    ├── publicacoes_page.dart     # Feed de publicações + botão de comentários
    └── comentarios_page.dart     # Discussão de uma publicação
```

## Banco de dados (Cloud Firestore)

### Coleção `missoes`

| Campo         | Tipo       | Descrição                                |
| ------------- | ---------- | ---------------------------------------- |
| `titulo`      | `string`   | Texto da publicação                      |
| `grau`        | `int`      | Grau da missão                           |
| `concluida`   | `bool`     | Missão concluída                         |
| `usuarioId`   | `string`   | UID de quem publicou                     |
| `nomeUsuario` | `string`   | Nome de quem publicou                    |
| `dataCriacao` | `timestamp` | Data de criação da publicação            |

### Coleção `comentarios`

| Campo         | Tipo       | Descrição                                |
| ------------- | ---------- | ---------------------------------------- |
| `texto`       | `string`   | Texto do comentário                      |
| `nomeUsuario` | `string`   | Nome de quem comentou                    |
| `usuarioId`   | `string`   | UID de quem comentou                     |
| `missaoId`    | `string`   | **Identificação da publicação** comentada |
| `dataCriacao` | `timestamp` | Data de criação do comentário            |

## Como executar

```bash
flutter pub add firebase_core
flutter pub add cloud_firestore
flutter pub add provider
flutter pub add device_preview

dart pub global activate flutterfire_cli
npm install -g firebase-tools
firebase login
dart pub global run flutterfire_cli:flutterfire configure

flutter run
```

> O `applicationId` do Android é `com.example.cadastro_feiticeiros` porque é o
> pacote registrado no projeto Firebase `fir-comflutter` — é ele que faz
> par com o `google-services.json` e com o `FirebaseOptions` gerado pelo
> FlutterFire CLI.

## Regras de segurança do Firestore

O arquivo `firestore.rules` está na raiz do projeto. Para publicá-lo no
projeto `fir-comflutter`:

```bash
firebase deploy --only firestore:rules
```

Resumo das regras:

- `missoes`: leitura para qualquer usuário autenticado; criação, alteração e
  exclusão apenas das próprias publicações.
- `comentarios`: leitura para qualquer usuário autenticado; criação apenas com
  o próprio `usuarioId`; exclusão apenas do próprio comentário.

## Teste da atividade

1. Entre com duas contas diferentes (uma janela do emulador/simulador e outra
   em outro dispositivo, ou duas contas do Google em aparelhos distintos).
2. Na primeira conta, publique uma missão.
3. Na segunda conta, abra a publicação pelo botão de comentários e comente.
4. O comentário aparece automaticamente na primeira conta, com a discussão
   aberta (sem atualizar a tela).
5. Comente também em outra publicação e confirme que os comentários ficam
   separados: cada publicação mostra apenas os seus.
6. Exclua um comentário próprio — o botão aparece apenas nos comentários do
   próprio usuário e a exclusão é liberada pelas regras do Firestore.

## Questões

**1. Como o Firebase identifica quem escreveu determinado comentário?**
Pelo `FirebaseAuth`: o `User` autenticado (`FirebaseAuth.instance.currentUser`)
fornece o `uid` e o `displayName`. Ao comentar, o app grava o `usuarioId`
(UID) e o `nomeUsuario` no documento do comentário. Esse UID é o mesmo que
identifica o usuário em qualquer dispositivo, por isso o app sabe de quem é o
comentário (e só o dono pode excluí-lo).

**2. Como relacionar um comentário a uma publicação específica?**
Cada documento da coleção `comentarios` guarda o campo `missaoId`, que recebe
o ID (chave) do documento da publicação na coleção `missoes`. A listagem é
feita com `where('missaoId', isEqualTo: missaoId)`, então cada publicação
mostra somente os comentários dela.

**3. Por que utilizamos `StreamBuilder` para mostrar os comentários?**
Porque o Firestore entrega os dados de uma coleção como um *stream*
(`snapshots()`): o `StreamBuilder` fica "escutando" esse stream e reconstrói a
tela a cada alteração. Assim, um comentário novo (ou uma exclusão) feita por
outro usuário chega na tela sem precisar atualizar a página, e o app não
precisa consultar o banco periodicamente.

**4. Como garantir que os comentários apareçam automaticamente em contas
diferentes?**
Os comentários são gravados no mesmo Firestore (coleção `comentarios`) e lidos
com `snapshots()`, que é um listener do Firestore: qualquer alteração feita
por uma conta é propagada pelo servidor para todos os outros clientes
conectados. Como o filtro é apenas por `missaoId`, o listener de cada
publicação recebe exatamente os comentários daquela discussão.
