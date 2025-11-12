// src/data/repositories/locatario_repo_isar.dart
// Implementação Isar de LocatarioRepo.

import 'package:isar/isar.dart';
import '../../domain/entities/locatario.dart';
import '../../domain/repositories/locatario_repo.dart';
import '../sources/isar_source.dart';

class LocatarioRepoIsar implements LocatarioRepo {
  final IsarSource source;
  LocatarioRepoIsar(this.source);

  @override
  Future<List<Locatario>> list() async {
    final isar = await source.db;
    return isar.locatarios.where().sortByNome().findAll();
  }

  @override
  Future<Locatario?> getById(int id) async {
    final isar = await source.db;
    return isar.locatarios.get(id);
  }

  @override
  Future<int> upsert(Locatario model) async {
    final isar = await source.db;
    final now = DateTime.now();
    model.id == 0 ? model.createdAt = now : model.updatedAt = now;
    return isar.writeTxn(() => isar.locatarios.put(model));
  }

  @override
  Future<void> delete(int id) async {
    final isar = await source.db;
    await isar.writeTxn(() => isar.locatarios.delete(id));
  }
}
