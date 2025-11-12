// Lista de imobiliárias com FAB e navegação para new/edit.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../presentation/providers/imobiliaria_providers.dart';
import '../../../domain/entities/imobiliaria.dart';
import '../../widgets/empty_state.dart';

class ImobiliariasListScreen extends ConsumerWidget {
  const ImobiliariasListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(imobiliariasListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Imobiliárias')),
      body: list.when(
        data: (items) {
          if (items.isEmpty) return const EmptyState('Nenhuma imobiliária.');
          return ListView.separated(
            itemCount: items.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (_, i) {
              final Imobiliaria m = items[i];
              return ListTile(
                title: Text(m.nome),
                subtitle: Text(m.cnpj ?? '-'),
                onTap: () => context.push('/imobiliarias/${m.id}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => ref.read(imobiliariaActionsProvider.notifier).remove(m.id),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erro: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/imobiliarias/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
