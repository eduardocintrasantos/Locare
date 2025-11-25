// src/presentation/providers/_repos_provider.dart
// Liga repositórios às implementações Supabase.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/imobiliaria_repo_supabase.dart';
import '../../data/repositories/casa_repo_supabase.dart';
import '../../data/repositories/locatario_repo_supabase.dart';
import '../../data/repositories/vinculo_repo_supabase.dart';
import '../../data/repositories/pagamento_repo_supabase.dart';
import '../../domain/repositories/imobiliaria_repo.dart';
import '../../domain/repositories/casa_repo.dart';
import '../../domain/repositories/locatario_repo.dart';
import '../../domain/repositories/vinculo_repo.dart';
import '../../domain/repositories/pagamento_repo.dart';

final imobiliariaRepoProvider =
    Provider<ImobiliariaRepo>((ref) => ImobiliariaRepoSupabase());
final casaRepoProvider = Provider<CasaRepo>((ref) => CasaRepoSupabase());
final locatarioRepoProvider =
    Provider<LocatarioRepo>((ref) => LocatarioRepoSupabase());
final vinculoRepoProvider =
    Provider<VinculoRepo>((ref) => VinculoRepoSupabase());
final pagamentoRepoProvider =
    Provider<PagamentoRepo>((ref) => PagamentoRepoSupabase());
