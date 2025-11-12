// src/presentation/providers/_repos_provider.dart
// Liga repositórios às implementações Isar via DI simples.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locare/src/presentation/providers/db_provider.dart';
import '../../data/repositories/imobiliaria_repo_isar.dart';
import '../../data/repositories/casa_repo_isar.dart';
import '../../data/repositories/locatario_repo_isar.dart';
import '../../data/repositories/vinculo_repo_isar.dart';
import '../../data/repositories/pagamento_repo_isar.dart';
import '../../data/sources/isar_source.dart';
import '../../domain/repositories/imobiliaria_repo.dart';
import '../../domain/repositories/casa_repo.dart';
import '../../domain/repositories/locatario_repo.dart';
import '../../domain/repositories/vinculo_repo.dart';
import '../../domain/repositories/pagamento_repo.dart';

final _src = Provider<IsarSource>((ref) => ref.read(isarSourceProvider));

final imobiliariaRepoProvider = Provider<ImobiliariaRepo>((ref) => ImobiliariaRepoIsar(ref.read(_src)));
final casaRepoProvider        = Provider<CasaRepo>       ((ref) => CasaRepoIsar(ref.read(_src)));
final locatarioRepoProvider   = Provider<LocatarioRepo>  ((ref) => LocatarioRepoIsar(ref.read(_src)));
final vinculoRepoProvider     = Provider<VinculoRepo>    ((ref) => VinculoRepoIsar(ref.read(_src)));
final pagamentoRepoProvider   = Provider<PagamentoRepo>  ((ref) => PagamentoRepoIsar(ref.read(_src)));
