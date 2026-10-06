import 'package:flutter/foundation.dart';

import '../models/game.dart';

class GameProvider extends ChangeNotifier {
  final List<Game> _jogos = [
    Game(nome: 'Elden Ring'),
    Game(nome: 'Red Dead Redemption 2', status: GameStatus.jogando),
    Game(nome: 'Hades', status: GameStatus.concluido),
  ];

  List<Game> get jogos => List.unmodifiable(_jogos);

  int get totalJogos => _jogos.length;

  int get totalQueroJogar =>
      _jogos.where((jogo) => jogo.status == GameStatus.queroJogar).length;

  int get totalJogando =>
      _jogos.where((jogo) => jogo.status == GameStatus.jogando).length;

  int get totalConcluidos =>
      _jogos.where((jogo) => jogo.status == GameStatus.concluido).length;

  void adicionarJogo(String nome) {
    final nomeLimpo = nome.trim();

    if (nomeLimpo.isEmpty) {
      return;
    }

    _jogos.add(Game(nome: nomeLimpo));
    notifyListeners();
  }

  void alterarStatus(Game jogo) {
    switch (jogo.status) {
      case GameStatus.queroJogar:
        jogo.status = GameStatus.jogando;
        break;
      case GameStatus.jogando:
        jogo.status = GameStatus.concluido;
        break;
      case GameStatus.concluido:
        jogo.status = GameStatus.queroJogar;
        break;
    }

    notifyListeners();
  }

  void removerJogo(Game jogo) {
    _jogos.remove(jogo);
    notifyListeners();
  }
}
