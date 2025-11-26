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
    final locs = ref.watch(locatariosListProvider).value ?? [];

    final fCasa = ref.watch(vinculoFiltroCasaProvider);
    final fImob = ref.watch(vinculoFiltroImobProvider);
    final fLoc = ref.watch(vinculoFiltroLocProvider);
    final apenasAtivos = ref.watch(vinculoApenasAtivosProvider);

    final lista = ref.watch(vinculosListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vínculos'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                DropdownButton<int?>(
                  value: fCasa,
                  hint: const Text('Casa'),
                  underline: const SizedBox(),
                  items: [
                    const DropdownMenuItem(
                        value: null, child: Text('Todas as casas')),
                    ...casas.map((Casa c) => DropdownMenuItem(
                        value: c.id, child: Text(c.descricao))),
                  ],
                  onChanged: (v) =>
                      ref.read(vinculoFiltroCasaProvider.notifier).state = v,
                ),
                const SizedBox(width: 8),
                DropdownButton<int?>(
                  value: fImob,
                  hint: const Text('Imobiliária'),
                  underline: const SizedBox(),
                  items: [
                    const DropdownMenuItem(value: null, child: Text('Todas')),
                    ...imobs.map((Imobiliaria i) =>
                        DropdownMenuItem(value: i.id, child: Text(i.nome))),
                  ],
                  onChanged: (v) =>
                      ref.read(vinculoFiltroImobProvider.notifier).state = v,
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Apenas ativos'),
                  selected: apenasAtivos,
                  onSelected: (s) =>
                      ref.read(vinculoApenasAtivosProvider.notifier).state = s,
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
      body: lista.when(
        data: (items) {
          if (items.isEmpty) return const EmptyState('Nenhum vínculo.');
          return ListView.separated(
            itemCount: items.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (_, i) {
              final Vinculo v = items[i];

              // Buscar nomes
              final casa = casas.firstWhere(
                (c) => c.id == v.casaId,
                orElse: () => Casa()..descricao = 'Casa não encontrada',
              );
              final imob = imobs.firstWhere(
                (im) => im.id == v.imobiliariaId,
                orElse: () =>
                    Imobiliaria()..nome = 'Imobiliária não encontrada',
              );
              final loc = v.locatarioId == 0
                  ? null
                  : locs.firstWhere(
                      (l) => l.id == v.locatarioId,
                      orElse: () =>
                          Locatario()..nome = 'Locatário não encontrado',
                    );

              final isAtivo = v.fim == null;
              final inicioFormatado =
                  '${v.inicio.day.toString().padLeft(2, '0')}/${v.inicio.month.toString().padLeft(2, '0')}/${v.inicio.year}';
              final fimFormatado = v.fim != null
                  ? '${v.fim!.day.toString().padLeft(2, '0')}/${v.fim!.month.toString().padLeft(2, '0')}/${v.fim!.year}'
                  : null;

              return ListTile(
                leading: Icon(
                  isAtivo ? Icons.home : Icons.home_outlined,
                  color: isAtivo ? Colors.green : Colors.grey,
                ),
                title: Text(
                  casa.descricao,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isAtivo ? null : Colors.grey,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${imob.nome} • ${loc?.nome ?? 'Sem locatário'}',
                      style: TextStyle(
                        color: isAtivo ? null : Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          'Início: $inicioFormatado',
                          style: TextStyle(
                            fontSize: 12,
                            color: isAtivo ? Colors.grey[600] : Colors.grey,
                          ),
                        ),
                        if (!isAtivo) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.red[100],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Finalizado em $fimFormatado',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.red[700],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
                isThreeLine: true,
                onTap: () => context.push('/vinculos/${v.id}'),
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
