// src/core/db/isar_db.dart
// Abre o Isar uma única vez.

import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/imobiliaria.dart';
import '../../domain/entities/casa.dart';
import '../../domain/entities/locatario.dart';
import '../../domain/entities/vinculo.dart';
import '../../domain/entities/pagamento.dart';

/*class IsarDb {
  static Isar? _instance;

  static Future<Isar> get instance async {
    if (_instance != null) return _instance!;
    _instance = await _open();
    return _instance!;
  }

  static Future<Isar> _open() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        ImobiliariaSchema,
        CasaSchema,
        LocatarioSchema,
        VinculoSchema,
        PagamentoSchema,
      ],
      directory: dir.path,
      // habilita o inspector apenas em debug (não em release/profile)
      inspector: kDebugMode,
    );
  }
}*/
