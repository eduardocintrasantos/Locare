// src/presentation/providers/imobiliaria_providers.dart
// Lista e ações básicas de Imobiliária.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/imobiliaria.dart';
import '../../domain/repositories/imobiliaria_repo.dart';
import '_repos_provider.dart';

final imobiliariasListProvider = FutureProvider<List<Imobiliaria>>((ref) async {
  final repo = ref.read(imobiliariaRepoProvider);
  return repo.list();
});

class ImobiliariaActions extends StateNotifier<AsyncValue<void>> {
  final ImobiliariaRepo repo;
  final Ref ref;
  ImobiliariaActions(this.repo, this.ref) : super(const AsyncData(null));

  Future<int> save(Imobiliaria m) async {
    state = const AsyncLoading();
    try {
      final id = await repo.upsert(m);
      state = const AsyncData(null);
      ref.invalidate(imobiliariasListProvider);
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
      ref.invalidate(imobiliariasListProvider);
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }
}

final imobiliariaActionsProvider =
    StateNotifierProvider<ImobiliariaActions, AsyncValue<void>>((ref) {
  final repo = ref.read(imobiliariaRepoProvider);
  return ImobiliariaActions(repo, ref);
});
