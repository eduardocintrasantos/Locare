// src/data/repositories/casa_repo_isar.dart
// Implementação Isar de CasaRepo (com filtro por imobiliariaId).

/*import 'package:isar/isar.dart';
import '../../domain/entities/casa.dart';
import '../../domain/repositories/casa_repo.dart';
import '../sources/isar_source.dart';

class CasaRepoIsar implements CasaRepo {
  final IsarSource source;
  CasaRepoIsar(this.source);

  @override
  Future<List<Casa>> list({int? imobiliariaId}) async {
    final isar = await source.db;
    if (imobiliariaId != null) {
      return isar.casas.filter().imobiliariaIdEqualTo(imobiliariaId).sortByDescricao().findAll();
    }
    return isar.casas.where().sortByDescricao().findAll();
  }

  @override
  Future<Casa?> getById(int id) async {
    final isar = await source.db;
    return isar.casas.get(id);
  }

  @override
  Future<int> upsert(Casa model) async {
    final isar = await source.db;
    final now = DateTime.now();
    if (model.id == 0 || model.id == Isar.autoIncrement) {
      model.createdAt = now;
    } else {
      model.updatedAt = now;
    }
    return isar.writeTxn(() => isar.casas.put(model));
  }

  @override
  Future<void> delete(int id) async {
    final isar = await source.db;
    await isar.writeTxn(() => isar.casas.delete(id));
  }
}
*/
