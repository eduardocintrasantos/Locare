// src/data/repositories/imobiliaria_repo_isar.dart
// Implementação Isar de ImobiliariaRepo.

import 'package:isar/isar.dart';
import '../../domain/entities/imobiliaria.dart';
import '../../domain/repositories/imobiliaria_repo.dart';
import '../sources/isar_source.dart';

class ImobiliariaRepoIsar implements ImobiliariaRepo {
  final IsarSource source;
  ImobiliariaRepoIsar(this.source);

  @override
  Future<List<Imobiliaria>> list() async {
    final isar = await source.db;
    return isar.imobiliarias.where().sortByNome().findAll();
  }

  @override
  Future<Imobiliaria?> getById(int id) async {
    final isar = await source.db;
    return isar.imobiliarias.get(id);
  }

  @override
  Future<int> upsert(Imobiliaria model) async {
    final isar = await source.db;
    final now = DateTime.now();
    model.id == 0 ? model.createdAt = now : model.updatedAt = now;
    return isar.writeTxn(() => isar.imobiliarias.put(model));
  }

  @override
  Future<void> delete(int id) async {
    final isar = await source.db;
    await isar.writeTxn(() => isar.imobiliarias.delete(id));
  }
}
