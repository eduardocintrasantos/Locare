// src/core/auth/auth_service.dart
// Gerencia autenticação com Supabase

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:logging/logging.dart';

final log = Logger('AuthService');

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Retorna o usuário atual logado (ou null)
  User? get currentUser => _supabase.auth.currentUser;

  // Verifica se está autenticado
  bool get isAuthenticated => currentUser != null;

  // Login com email e senha
  Future<AuthResponse?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      log.info('✅ Login realizado: ${response.user?.email}');
      return response;
    } on AuthException catch (e) {
      log.severe('❌ Erro de autenticação: ${e.message}');
      rethrow;
    } catch (e) {
      log.severe('❌ Erro no login: $e');
      rethrow;
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      await _supabase.auth.signOut();
      log.info('✅ Logout realizado');
    } catch (e) {
      log.severe('❌ Erro no logout: $e');
      rethrow;
    }
  }

  // Stream de mudanças de autenticação
  Stream<AuthState> get authStateChanges => _supabase.auth.onAuthStateChange;

  // Pegar ID do usuário atual
  String? get userId => currentUser?.id;
}
