// src/data/repositories/vinculo_repo_isar.dart

import 'package:isar/isar.dart';
import '../../domain/entities/vinculo.dart';
import '../../domain/repositories/vinculo_repo.dart';
import '../sources/isar_source.dart';

class VinculoRepoIsar implements VinculoRepo {
  final IsarSource source;
  VinculoRepoIsar(this.source);

  @override
  Future<List<Vinculo>> list({
    int? casaId,
    int? imobiliariaId,
    int? locatarioId,
    bool? apenasAtivos,
  }) async {
    final isar = await source.db;
    // Simples: buscar todos ordenados e aplicar filtros em memória.
    // Isso evita problemas com diferentes estados do QueryBuilder/extension
    // e é aceitável para bases pequenas/medianas.
    final all = await isar.vinculos.where().sortByInicioDesc().findAll();

    var filtered = all;
    if (casaId != null)
      filtered = filtered.where((v) => v.casaId == casaId).toList();
    if (imobiliariaId != null)
      filtered =
          filtered.where((v) => v.imobiliariaId == imobiliariaId).toList();
    if (locatarioId != null)
      filtered = filtered.where((v) => v.locatarioId == locatarioId).toList();
    if (apenasAtivos == true)
      filtered = filtered.where((v) => v.fim == null).toList();

    return filtered;
  }

  @override
  Future<Vinculo?> getById(int id) async {
    final isar = await source.db;
    return isar.vinculos.get(id);
  }

  @override
  Future<int> upsertComRegras(Vinculo model) async {
    final isar = await source.db;
    final now = DateTime.now();

    return isar.writeTxn(() async {
      // Se é novo registro (id = 0 ou autoIncrement)
      if (model.id == 0 || model.id == Isar.autoIncrement) {
        model.createdAt = now;

        // Finaliza vínculos ativos da mesma casa
        final ativos = await isar.vinculos
            .filter()
            .casaIdEqualTo(model.casaId)
            .and()
            .fimIsNull()
            .findAll();

        for (final v in ativos) {
          // fim = dia anterior ao novo início
          v.fim = model.inicio.subtract(const Duration(days: 1));
          v.updatedAt = now;
          await isar.vinculos.put(v);
        }

        return isar.vinculos.put(model);
      } else {
        // Se é edição
        final atual = await isar.vinculos.get(model.id);
        // Finalizado => somente leitura
        if (atual != null && atual.fim != null) return atual.id;
        model.updatedAt = now;
        return isar.vinculos.put(model);
      }
    });
  }

  @override
  Future<void> finalizar(int id) async {
    final isar = await source.db;
    await isar.writeTxn(() async {
      final v = await isar.vinculos.get(id);
      if (v == null) return;
      if (v.fim != null) return; // já finalizado
      v.fim = DateTime.now();
      v.updatedAt = DateTime.now();
      await isar.vinculos.put(v);
    });
  }

  @override
  Future<void> delete(int id) async {
    final isar = await source.db;
    await isar.vinculos.delete(id); // dentro de txn já tá ok
  }
}
