// src/data/repositories/pagamento_repo_isar.dart
// Marca/estorna recebimento por (vinculoId, ano, mes).

import 'package:isar/isar.dart';
import '../../domain/entities/pagamento.dart';
import '../../domain/repositories/pagamento_repo.dart';
import '../sources/isar_source.dart';

class PagamentoRepoIsar implements PagamentoRepo {
  final IsarSource source;
  PagamentoRepoIsar(this.source);

  @override
  Future<Pagamento?> getByVinculoAnoMes(int vinculoId, int ano, int mes) async {
    final isar = await source.db;
    return isar.pagamentos
        .filter()
        .vinculoIdEqualTo(vinculoId)
        .and()
        .anoEqualTo(ano)
        .and()
        .mesEqualTo(mes)
        .findFirst();
  }

  @override
  Future<Pagamento> marcarRecebido(int vinculoId, int ano, int mes) async {
    final isar = await source.db;
    final now = DateTime.now();
    return isar.writeTxn(() async {
      final atual = await getByVinculoAnoMes(vinculoId, ano, mes);
      if (atual != null) {
        atual
          ..recebido = true
          ..recebidoEm = now
          ..updatedAt = now;
        await isar.pagamentos.put(atual);
        return atual;
      }
      final novo = Pagamento()
        ..vinculoId = vinculoId
        ..ano = ano
        ..mes = mes
        ..recebido = true
        ..recebidoEm = now
        ..createdAt = now;
      await isar.pagamentos.put(novo);
      return novo;
    });
  }

  @override
  Future<Pagamento> estornar(int vinculoId, int ano, int mes) async {
    final isar = await source.db;
    final now = DateTime.now();
    return isar.writeTxn(() async {
      final atual = await getByVinculoAnoMes(vinculoId, ano, mes);
      if (atual != null) {
        atual
          ..recebido = false
          ..recebidoEm = null
          ..updatedAt = now;
        await isar.pagamentos.put(atual);
        return atual;
      }
      final novo = Pagamento()
        ..vinculoId = vinculoId
        ..ano = ano
        ..mes = mes
        ..recebido = false
        ..createdAt = now;
      await isar.pagamentos.put(novo);
      return novo;
    });
  }

  @override
  Future<List<Pagamento>> listByAnoMes({required int ano, required int mes}) async {
    final isar = await source.db;
    return isar.pagamentos.filter().anoEqualTo(ano).and().mesEqualTo(mes).findAll();
  }
}
