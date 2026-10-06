# GameTracker

Aplicativo Flutter simples para organizar uma lista de jogos.

O projeto foi desenvolvido para demonstrar o gerenciamento de estado utilizando
Provider e ChangeNotifier.

## Funcionalidades

- Adicionar jogos;
- Remover jogos;
- Alterar o status de um jogo;
- Visualizar os jogos cadastrados;
- Visualizar estatísticas;
- Compartilhar o mesmo estado entre duas páginas.

## Status dos jogos

Um jogo pode possuir três status:

- Quero jogar;
- Jogando;
- Concluído.

Ao selecionar "Alterar status", o jogo passa para o próximo status.

## Tecnologias utilizadas

- Flutter;
- Dart;
- Provider;
- ChangeNotifier;
- Material Design.

## Estrutura

```text
lib/
├── main.dart
├── models/
│   └── game.dart
├── providers/
│   └── game_provider.dart
├── pages/
│   ├── home_page.dart
│   └── estatisticas_page.dart
└── widgets/
    └── game_card.dart
```

## Onde o Provider é utilizado?

No `main.dart`, o `ChangeNotifierProvider` disponibiliza o
`GameProvider` para toda a aplicação:

```dart
ChangeNotifierProvider(
  create: (_) => GameProvider(),
  child: const GameTrackerApp(),
)
```

O `GameProvider` possui a lista de jogos e os métodos que alteram essa lista.

Sempre que uma alteração é realizada, o método:

```dart
notifyListeners();
```
avisa os widgets que estão observando o Provider para atualizarem a interface.


## Como executar

Depois de criar o projeto:

```bash
flutter pub get
flutter run
```
