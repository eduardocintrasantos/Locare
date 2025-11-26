// Lista de locatários com FAB.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/locatario_providers.dart';
import '../../providers/vinculo_check_provider.dart';
import '../../../domain/entities/locatario.dart';
import '../../widgets/empty_state.dart';
import '../../widgets/confirm_dialog.dart';

class LocatariosListScreen extends ConsumerWidget {
  const LocatariosListScreen({super.key});

  Future<void> _handleDelete(
      BuildContext context, WidgetRef ref, Locatario m) async {
    final check = await ref.read(vinculosLocatarioProvider(m.id).future);

    if (check.temVinculoAtivo) {
      // Não pode excluir - tem vínculo ativo
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Não é possível excluir'),
            content: Text(
              'Este locatário possui ${check.quantidadeAtivos} vínculo(s) ativo(s).\n\n'
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
          title: 'Excluir locatário?',
          message:
              'Este locatário possui ${check.quantidadeFinalizados} vínculo(s) finalizado(s).\n\n'
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
          title: 'Excluir locatário?',
          message: 'Deseja excluir "${m.nome}"?',
        );
        if (!ok) return;
      }
    }

    // Excluir
    try {
      await ref.read(locatarioActionsProvider.notifier).remove(m.id);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Locatário excluído')),
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
    final lista = ref.watch(locatariosListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Locatários')),
      body: lista.when(
        data: (items) {
          if (items.isEmpty) return const EmptyState('Nenhum locatário.');
          return ListView.separated(
            itemCount: items.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (_, i) {
              final Locatario m = items[i];
              return ListTile(
                title: Text(m.nome),
                subtitle: Text(m.telefone ?? '-'),
                onTap: () => context.push('/locatarios/${m.id}'),
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
        onPressed: () => context.push('/locatarios/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
