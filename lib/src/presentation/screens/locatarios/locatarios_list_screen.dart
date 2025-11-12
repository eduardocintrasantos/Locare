// Lista de locatários com FAB.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/locatario_providers.dart';
import '../../../domain/entities/locatario.dart';
import '../../widgets/empty_state.dart';

class LocatariosListScreen extends ConsumerWidget {
  const LocatariosListScreen({super.key});

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
                  onPressed: () => ref.read(locatarioActionsProvider.notifier).remove(m.id),
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
