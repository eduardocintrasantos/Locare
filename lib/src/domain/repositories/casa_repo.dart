// src/domain/repositories/casa_repo.dart
// Contrato do repositório de Casa.
// Nota: O vínculo com Imobiliária é feito apenas na tabela TVINCULOS.

import '../entities/casa.dart';

abstract class CasaRepo {
  Future<List<Casa>> list();
  Future<Casa?> getById(int id);
  Future<int> upsert(Casa model);
  Future<void> delete(int id);
}
