// Lista de vínculos com filtros e botão para ativos.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/vinculo_providers.dart';
import '../../providers/casa_providers.dart';
import '../../providers/imobiliaria_providers.dart';
import '../../providers/locatario_providers.dart';
import '../../../domain/entities/vinculo.dart';
import '../../../domain/entities/casa.dart';
import '../../../domain/entities/imobiliaria.dart';
import '../../../domain/entities/locatario.dart';
import '../../widgets/empty_state.dart';

class VinculosListScreen extends ConsumerWidget {
  const VinculosListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final casas = ref.watch(casasListProvider).value ?? [];
    final imobs = ref.watch(imobiliariasListProvider).value ?? [];
    final locs  = ref.watch(locatariosListProvider).value ?? [];

    final fCasa = ref.watch(vinculoFiltroCasaProvider);
    final fImob = ref.watch(vinculoFiltroImobProvider);
    final fLoc  = ref.watch(vinculoFiltroLocProvider);
    final apenasAtivos = ref.watch(vinculoApenasAtivosProvider);

    final lista = ref.watch(vinculosListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vínculos'),
        actions: [
          DropdownButton<int?>(
            value: fCasa,
            hint: const Text('Casa'),
            underline: const SizedBox(),
            items: [
              const DropdownMenuItem(value: null, child: Text('Todas as casas')),
              ...casas.map((Casa c) => DropdownMenuItem(value: c.id, child: Text(c.descricao))),
            ],
            onChanged: (v) => ref.read(vinculoFiltroCasaProvider.notifier).state = v,
          ),
          const SizedBox(width: 8),
          DropdownButton<int?>(
            value: fImob,
            hint: const Text('Imobiliária'),
            underline: const SizedBox(),
            items: [
              const DropdownMenuItem(value: null, child: Text('Todas')),
              ...imobs.map((Imobiliaria i) => DropdownMenuItem(value: i.id, child: Text(i.nome))),
            ],
            onChanged: (v) => ref.read(vinculoFiltroImobProvider.notifier).state = v,
          ),
          const SizedBox(width: 8),
          DropdownButton<int?>(
            value: fLoc,
            hint: const Text('Locatário'),
            underline: const SizedBox(),
            items: [
              const DropdownMenuItem(value: null, child: Text('Todos')),
              ...locs.map((Locatario l) => DropdownMenuItem(value: l.id, child: Text(l.nome))),
            ],
            onChanged: (v) => ref.read(vinculoFiltroLocProvider.notifier).state = v,
          ),
          const SizedBox(width: 8),
          FilterChip(
            label: const Text('Apenas ativos'),
            selected: apenasAtivos,
            onSelected: (s) => ref.read(vinculoApenasAtivosProvider.notifier).state = s,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: lista.when(
        data: (items) {
          if (items.isEmpty) return const EmptyState('Nenhum vínculo.');
          return ListView.separated(
            itemCount: items.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (_, i) {
              final Vinculo v = items[i];
              return ListTile(
                title: Text('Casa #${v.casaId} • Imob #${v.imobiliariaId} • Loc #${v.locatarioId}'),
                subtitle: Text('Início: ${v.inicio.toString().split(' ').first}'
                    '${v.fim != null ? '  |  Fim: ${v.fim!.toString().split(' ').first}' : ''}'),
                onTap: () => context.push('/vinculos/${v.id}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => ref.read(vinculoActionsProvider.notifier).remove(v.id),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erro: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/vinculos/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
