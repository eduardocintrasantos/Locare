// src/presentation/providers/vinculo_providers.dart
// Filtros, lista e ações de Vínculo (regras de negócio).

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/vinculo.dart';
import '../../domain/repositories/vinculo_repo.dart';
import '_repos_provider.dart';
import 'auth_provider.dart';

final vinculoFiltroCasaProvider = StateProvider<int?>((_) => null);
final vinculoFiltroImobProvider = StateProvider<int?>((_) => null);
final vinculoFiltroLocProvider = StateProvider<int?>((_) => null);
final vinculoApenasAtivosProvider = StateProvider<bool>((_) => false);

final vinculosListProvider = FutureProvider<List<Vinculo>>((ref) async {
  // Observa o refresh para recarregar quando usuário muda
  ref.watch(dataRefreshProvider);
  final repo = ref.read(vinculoRepoProvider);
  return repo.list(
    casaId: ref.watch(vinculoFiltroCasaProvider),
    imobiliariaId: ref.watch(vinculoFiltroImobProvider),
    locatarioId: ref.watch(vinculoFiltroLocProvider),
    apenasAtivos: ref.watch(vinculoApenasAtivosProvider),
  );
});

class VinculoActions extends StateNotifier<AsyncValue<void>> {
  final VinculoRepo repo;
  final Ref ref;
  VinculoActions(this.repo, this.ref) : super(const AsyncData(null));

  Future<int> save(Vinculo m) async {
    state = const AsyncLoading();
    try {
      final id = await repo.upsertComRegras(m);
      state = const AsyncData(null);
      ref.invalidate(vinculosListProvider);
      return id;
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }

  Future<void> finalizar(int id) async {
    state = const AsyncLoading();
    try {
      await repo.finalizar(id);
      state = const AsyncData(null);
      ref.invalidate(vinculosListProvider);
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }

  Future<void> remove(int id) async {
    state = const AsyncLoading();
    try {
      await repo.delete(id);
      state = const AsyncData(null);
      ref.invalidate(vinculosListProvider);
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }
}

final vinculoActionsProvider =
    StateNotifierProvider<VinculoActions, AsyncValue<void>>((ref) {
  final repo = ref.read(vinculoRepoProvider);
  return VinculoActions(repo, ref);
});
