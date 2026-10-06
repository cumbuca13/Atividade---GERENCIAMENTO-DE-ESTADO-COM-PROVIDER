import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';
import '../widgets/game_card.dart';
import 'estatisticas_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _abrirAdicionarJogo(BuildContext context) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Adicionar jogo'),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(
              labelText: 'Nome do jogo',
              hintText: 'Ex.: Hollow Knight',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (_) {
              final nome = controller.text.trim();

              if (nome.isNotEmpty) {
                context.read<GameProvider>().adicionarJogo(nome);
                Navigator.pop(dialogContext);
              }
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () {
                final nome = controller.text.trim();

                if (nome.isNotEmpty) {
                  context.read<GameProvider>().adicionarJogo(nome);
                  Navigator.pop(dialogContext);
                }
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GameProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GameTracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            tooltip: 'Estatísticas',
            icon: const Icon(Icons.bar_chart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const EstatisticasPage(),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _abrirAdicionarJogo(context),
        icon: const Icon(Icons.add),
        label: const Text('Adicionar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Meus jogos',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${provider.totalJogos} jogo(s) cadastrado(s)',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: provider.jogos.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhum jogo cadastrado.\nClique em "Adicionar" para começar.',
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView.builder(
                      itemCount: provider.jogos.length,
                      itemBuilder: (context, index) {
                        return GameCard(
                          jogo: provider.jogos[index],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
