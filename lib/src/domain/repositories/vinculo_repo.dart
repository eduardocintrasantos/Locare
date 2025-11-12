// src/domain/repositories/vinculo_repo.dart
// Contrato do repositório de Vinculo (inclui regras de 1 ativo por casa).

import '../entities/vinculo.dart';

abstract class VinculoRepo {
  Future<List<Vinculo>> list({int? casaId, int? imobiliariaId, int? locatarioId, bool? apenasAtivos});
  Future<Vinculo?> getById(int id);

  /// Insere/atualiza. Se inserir um novo com inicio X para mesma casa,
  /// finaliza vínculos ativos anteriores (fim = X - 1 dia).
  Future<int> upsertComRegras(Vinculo model);

  /// Finaliza vínculo (fim = hoje). Vínculo finalizado vira somente leitura.
  Future<void> finalizar(int id);

  Future<void> delete(int id);
}
