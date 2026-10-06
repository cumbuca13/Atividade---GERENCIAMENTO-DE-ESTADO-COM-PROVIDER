import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/game.dart';
import '../providers/game_provider.dart';

class GameCard extends StatelessWidget {
  final Game jogo;

  const GameCard({
    super.key,
    required this.jogo,
  });

  String get statusTexto {
    switch (jogo.status) {
      case GameStatus.queroJogar:
        return 'Quero jogar';
      case GameStatus.jogando:
        return 'Jogando';
      case GameStatus.concluido:
        return 'Concluído';
    }
  }

  IconData get statusIcone {
    switch (jogo.status) {
      case GameStatus.queroJogar:
        return Icons.bookmark_border;
      case GameStatus.jogando:
        return Icons.sports_esports;
      case GameStatus.concluido:
        return Icons.check_circle_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: CircleAvatar(
          child: Icon(statusIcone),
        ),
        title: Text(
          jogo.nome,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(statusTexto),
        trailing: PopupMenuButton<String>(
          onSelected: (valor) {
            if (valor == 'status') {
              context.read<GameProvider>().alterarStatus(jogo);
            }

            if (valor == 'remover') {
              context.read<GameProvider>().removerJogo(jogo);
            }
          },
          itemBuilder: (context) => const [
            PopupMenuItem(
              value: 'status',
              child: Text('Alterar status'),
            ),
            PopupMenuItem(
              value: 'remover',
              child: Text('Remover'),
            ),
          ],
        ),
      ),
    );
  }
}
