// src/data/sources/isar_source.dart
// Fornece acesso ao Isar (singleton) e um seed opcional.

/*import 'package:isar/isar.dart';
import '../../core/db/isar_db.dart';
import '../../domain/entities/imobiliaria.dart';
import '../../domain/entities/casa.dart';

class IsarSource {
  Future<Isar> get db => IsarDb.instance;

  Future<List<Imobiliaria>> getAllImobiliarias() async {
    final isar = await db;
    return await isar.imobiliarias.where().findAll();
  }

  Future<List<Casa>> getAllCasas() async {
    final isar = await db;
    return await isar.casas.where().findAll();
  }
}
*/
