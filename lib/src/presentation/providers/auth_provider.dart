// src/presentation/providers/auth_provider.dart
// Provider que rastreia o usuário atual e força recarga dos dados quando muda.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/auth/auth_service.dart';

/// Provider que contém o ID do usuário atual.
/// Quando muda (login/logout), todos os providers que dependem dele são invalidados.
final currentUserIdProvider = StateProvider<String?>((ref) {
  return AuthService.currentUserId;
});

/// Provider para forçar refresh de todos os dados.
/// Incrementar este valor força todos os providers que o observam a recarregar.
final dataRefreshProvider = StateProvider<int>((ref) => 0);
