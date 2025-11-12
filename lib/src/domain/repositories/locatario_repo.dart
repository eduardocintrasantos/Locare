// src/domain/repositories/locatario_repo.dart
// Contrato do repositório de Locatario.

import '../entities/locatario.dart';

abstract class LocatarioRepo {
  Future<List<Locatario>> list();
  Future<Locatario?> getById(int id);
  Future<int> upsert(Locatario model);
  Future<void> delete(int id);
}
