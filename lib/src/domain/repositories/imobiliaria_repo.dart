// src/domain/repositories/imobiliaria_repo.dart
// Contrato do repositório de Imobiliaria.

import '../entities/imobiliaria.dart';

abstract class ImobiliariaRepo {
  Future<List<Imobiliaria>> list();
  Future<Imobiliaria?> getById(int id);
  Future<int> upsert(Imobiliaria model); // retorna id
  Future<void> delete(int id);
}
