// src/presentation/providers/casa_providers.dart
// Lista de casas e ações.
// Nota: O vínculo com Imobiliária é feito na tabela TVINCULOS.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/casa.dart';
import '../../domain/repositories/casa_repo.dart';
import '_repos_provider.dart';
import 'auth_provider.dart';

final casasListProvider = FutureProvider<List<Casa>>((ref) async {
  // Observa o refresh para recarregar quando usuário muda
  ref.watch(dataRefreshProvider);
  final repo = ref.read(casaRepoProvider);
  return repo.list();
});

class CasaActions extends StateNotifier<AsyncValue<void>> {
  final CasaRepo repo;
  final Ref ref;
  CasaActions(this.repo, this.ref) : super(const AsyncData(null));

  Future<int> save(Casa m) async {
    state = const AsyncLoading();
    try {
      final id = await repo.upsert(m);
      state = const AsyncData(null);
      ref.invalidate(casasListProvider);
      return id;
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
      ref.invalidate(casasListProvider);
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }
}

final casaActionsProvider =
    StateNotifierProvider<CasaActions, AsyncValue<void>>((ref) {
  final repo = ref.read(casaRepoProvider);
  return CasaActions(repo, ref);
});
