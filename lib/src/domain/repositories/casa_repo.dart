// src/domain/repositories/casa_repo.dart
// Contrato do repositório de Casa.

import '../entities/casa.dart';

abstract class CasaRepo {
  Future<List<Casa>> list({int? imobiliariaId});
  Future<Casa?> getById(int id);
  Future<int> upsert(Casa model);
  Future<void> delete(int id);
}
