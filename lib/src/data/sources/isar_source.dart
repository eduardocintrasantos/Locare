// src/data/sources/isar_source.dart
// Fornece acesso ao Isar (singleton) e um seed opcional.

import 'package:isar/isar.dart';
import '../../core/db/isar_db.dart';
import '../../domain/entities/imobiliaria.dart';
import '../../domain/entities/casa.dart';
import '../../domain/entities/locatario.dart';
import '../../domain/entities/vinculo.dart';
import '../../domain/entities/pagamento.dart';

class IsarSource {
  Future<Isar> get db => IsarDb.instance;

  // Cria 1 imobiliária, 1 casa, 1 locatário e 1 vínculo + 1 mês recebido (opcional).
  Future<void> seedIfEmpty() async {
    final isar = await db;
    final hasImob = await isar.imobiliarias.count() > 0;
    if (hasImob) return;

    final now = DateTime.now();
    final im = Imobiliaria()
      ..nome = 'Imob Alfa'
      ..createdAt = now;
    final casa = Casa()
      ..descricao = 'Casa 101'
      ..bairro = 'Centro'
      ..createdAt = now;
    final loc = Locatario()
      ..nome = 'João da Silva'
      ..telefone = '11999999999'
      ..createdAt = now;

    await isar.writeTxn(() async {
      final imId = await isar.imobiliarias.put(im);
      casa.imobiliariaId = imId;
      final casaId = await isar.casas.put(casa);
      final locId = await isar.locatarios.put(loc);

      final vinc = Vinculo()
        ..casaId = casaId
        ..imobiliariaId = imId
        ..locatarioId = locId
        ..valorAluguel = 1500
        ..taxaPercent = 10
        ..taxaValor = 150
        ..inicio = DateTime(now.year, now.month, 1)
        ..createdAt = now;

      final vincId = await isar.vinculos.put(vinc);

      // Marca mês anterior como recebido
      final anterior = DateTime(now.year, now.month - 1, 1);
      final pg = Pagamento()
        ..vinculoId = vincId
        ..ano = anterior.year
        ..mes = anterior.month
        ..recebido = true
        ..recebidoEm = now
        ..createdAt = now;
      await isar.pagamentos.put(pg);
    });
  }
}
