// src/presentation/providers/locatario_providers.dart
// Lista e ações de Locatário.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/locatario.dart';
import '../../domain/repositories/locatario_repo.dart';
import '_repos_provider.dart';
import 'auth_provider.dart';

final locatariosListProvider = FutureProvider<List<Locatario>>((ref) async {
  // Observa o refresh para recarregar quando usuário muda
  ref.watch(dataRefreshProvider);
  final repo = ref.read(locatarioRepoProvider);
  return repo.list();
});

class LocatarioActions extends StateNotifier<AsyncValue<void>> {
  final LocatarioRepo repo;
  final Ref ref;
  LocatarioActions(this.repo, this.ref) : super(const AsyncData(null));

  Future<int> save(Locatario m) async {
    state = const AsyncLoading();
    try {
      final id = await repo.upsert(m);
      state = const AsyncData(null);
      ref.invalidate(locatariosListProvider);
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
      ref.invalidate(locatariosListProvider);
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }
}

final locatarioActionsProvider =
    StateNotifierProvider<LocatarioActions, AsyncValue<void>>((ref) {
  final repo = ref.read(locatarioRepoProvider);
  return LocatarioActions(repo, ref);
});
