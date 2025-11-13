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

    // Se houver filtros, comece com `filter()` (permite encadear os filtros
    // e depois chamar `sortByInicioDesc()`); caso contrário use `where()`.
    if (casaId != null || imobiliariaId != null || locatarioId != null || apenasAtivos == true) {
      final q0 = isar.vinculos.filter();
      final q1 = (casaId != null) ? q0.casaIdEqualTo(casaId) : q0;
      final q2 = (imobiliariaId != null) ? q1.imobiliariaIdEqualTo(imobiliariaId) : q1;
      final q3 = (locatarioId != null) ? q2.locatarioIdEqualTo(locatarioId) : q2;
      final q4 = (apenasAtivos == true) ? q3.fimIsNull() : q3;

      final result = await (q4 as dynamic).findAll();
      result.sort((a, b) => b.inicio.compareTo(a.inicio));
      return result;
    }

    return isar.vinculos.where().sortByInicioDesc().findAll();
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
