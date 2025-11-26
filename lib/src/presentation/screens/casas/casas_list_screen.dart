// Lista de casas.
// Nota: O vínculo com Imobiliária é feito na aba de Vínculos.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/casa_providers.dart';
import '../../providers/vinculo_check_provider.dart';
import '../../../domain/entities/casa.dart';
import '../../widgets/empty_state.dart';
import '../../widgets/confirm_dialog.dart';

class CasasListScreen extends ConsumerWidget {
  const CasasListScreen({super.key});

  Future<void> _handleDelete(
      BuildContext context, WidgetRef ref, Casa m) async {
    final check = await ref.read(vinculosCasaProvider(m.id).future);

    if (check.temVinculoAtivo) {
      // Não pode excluir - tem vínculo ativo
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Não é possível excluir'),
            content: Text(
              'Esta casa possui ${check.quantidadeAtivos} vínculo(s) ativo(s).\n\n'
              'Finalize todos os vínculos antes de excluir.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
      return;
    }

    if (check.temVinculoFinalizado) {
      // Tem vínculos finalizados - avisar que vai excluir histórico
      if (context.mounted) {
        final ok = await confirmDialog(
          context,
          title: 'Excluir casa?',
          message:
              'Esta casa possui ${check.quantidadeFinalizados} vínculo(s) finalizado(s).\n\n'
              'Ao excluir, todo o histórico será perdido.\n\n'
              'Deseja continuar?',
        );
        if (!ok) return;
      }
    } else {
      // Sem vínculos - confirmação simples
      if (context.mounted) {
        final ok = await confirmDialog(
          context,
          title: 'Excluir casa?',
          message: 'Deseja excluir "${m.descricao}"?',
        );
        if (!ok) return;
      }
    }

    // Excluir
    try {
      await ref.read(casaActionsProvider.notifier).remove(m.id);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Casa excluída')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao excluir: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lista = ref.watch(casasListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Casas'),
      ),
      body: lista.when(
        data: (items) {
          if (items.isEmpty) return const EmptyState('Sem casas.');
          return ListView.separated(
            itemCount: items.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (_, i) {
              final Casa m = items[i];
              return ListTile(
                title: Text(m.descricao),
                subtitle: Text([m.rua, m.numero, m.bairro]
                    .where((e) => (e ?? '').isNotEmpty)
                    .join(', ')),
                onTap: () => context.push('/casas/${m.id}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => _handleDelete(context, ref, m),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erro: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/casas/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
