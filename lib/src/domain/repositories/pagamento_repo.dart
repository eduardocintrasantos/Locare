// src/domain/repositories/pagamento_repo.dart
// Contrato do repositório de Pagamento (toggle por ano/mês).

import '../entities/pagamento.dart';

abstract class PagamentoRepo {
  Future<Pagamento?> getByVinculoAnoMes(int vinculoId, int ano, int mes);
  Future<Pagamento> marcarRecebido(int vinculoId, int ano, int mes);
  Future<Pagamento> estornar(int vinculoId, int ano, int mes);
  Future<List<Pagamento>> listByAnoMes({required int ano, required int mes});
}
