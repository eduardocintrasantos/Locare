// Lista de casas com filtro por imobiliária.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/casa_providers.dart';
import '../../providers/imobiliaria_providers.dart';
import '../../../domain/entities/casa.dart';
import '../../../domain/entities/imobiliaria.dart';
import '../../widgets/empty_state.dart';

class CasasListScreen extends ConsumerWidget {
  const CasasListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imobs = ref.watch(imobiliariasListProvider).value ?? [];
    final filtro = ref.watch(casasFiltroImobiliariaProvider);
    final lista = ref.watch(casasListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Casas'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: DropdownButton<int?>(
              value: filtro,
              hint: const Text('Imobiliária'),
              underline: const SizedBox(),
              onChanged: (val) => ref.read(casasFiltroImobiliariaProvider.notifier).state = val,
              items: [
                const DropdownMenuItem(value: null, child: Text('Todas')),
                ...imobs.map((Imobiliaria i) =>
                    DropdownMenuItem(value: i.id, child: Text(i.nome))),
              ],
            ),
          )
        ],
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
                subtitle: Text([m.rua, m.numero, m.bairro].where((e) => (e ?? '').isNotEmpty).join(', ')),
                onTap: () => context.push('/casas/${m.id}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => ref.read(casaActionsProvider.notifier).remove(m.id),
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
