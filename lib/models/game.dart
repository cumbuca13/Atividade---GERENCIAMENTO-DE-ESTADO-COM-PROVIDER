enum GameStatus {
  queroJogar,
  jogando,
  concluido,
}

class Game {
  final String nome;
  GameStatus status;

  Game({
    required this.nome,
    this.status = GameStatus.queroJogar,
  });
}
