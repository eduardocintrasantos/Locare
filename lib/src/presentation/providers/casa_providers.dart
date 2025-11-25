// src/presentation/providers/casa_providers.dart
// Lista com filtro por imobiliariaId e ações.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/casa.dart';
import '../../domain/repositories/casa_repo.dart';
import '_repos_provider.dart';

final casasFiltroImobiliariaProvider = StateProvider<int?>((_) => null);

final casasListProvider = FutureProvider<List<Casa>>((ref) async {
  final repo = ref.read(casaRepoProvider);
  final imId = ref.watch(casasFiltroImobiliariaProvider);
  return repo.list(imobiliariaId: imId);
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
