import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';

class EstatisticasPage extends StatelessWidget {
  const EstatisticasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GameProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Estatísticas',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Resumo da biblioteca',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Os números abaixo usam o mesmo estado compartilhado '
            'da página principal.',
          ),
          const SizedBox(height: 24),
          _StatisticCard(
            titulo: 'Total de jogos',
            valor: provider.totalJogos,
            icone: Icons.videogame_asset,
          ),
          _StatisticCard(
            titulo: 'Quero jogar',
            valor: provider.totalQueroJogar,
            icone: Icons.bookmark_border,
          ),
          _StatisticCard(
            titulo: 'Jogando',
            valor: provider.totalJogando,
            icone: Icons.sports_esports,
          ),
          _StatisticCard(
            titulo: 'Concluídos',
            valor: provider.totalConcluidos,
            icone: Icons.check_circle_outline,
          ),
        ],
      ),
    );
  }
}

class _StatisticCard extends StatelessWidget {
  final String titulo;
  final int valor;
  final IconData icone;

  const _StatisticCard({
    required this.titulo,
    required this.valor,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        leading: CircleAvatar(
          child: Icon(icone),
        ),
        title: Text(titulo),
        trailing: Text(
          '$valor',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
