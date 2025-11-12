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

    // 1) Começa no where() para habilitar sortBy...
    final base = isar.vinculos.where().sortByInicioDesc();

    // 2) Entra no filter() e aplica os filtros opcionais
    var f = base.filter();

    if (casaId != null) {
      f = f.casaIdEqualTo(casaId);
    }
    if (imobiliariaId != null) {
      f = f.imobiliariaIdEqualTo(imobiliariaId);
    }
    if (locatarioId != null) {
      f = f.locatarioIdEqualTo(locatarioId);
    }
    if (apenasAtivos == true) {
      f = f.fimIsNull();
    }

    // 3) Executa
    return f.findAll();
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
      if (model.id != 0) {
        final atual = await isar.vinculos.get(model.id);
        // Finalizado => somente leitura
        if (atual != null && atual.fim != null) return atual.id;
        model.updatedAt = now;
        return isar.vinculos.put(model);
      } else {
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
