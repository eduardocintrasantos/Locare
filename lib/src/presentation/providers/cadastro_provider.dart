// src/presentation/providers/cadastro_provider.dart
// Provider para gerenciar o estado do cadastro de usuários.

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/cadastro_repo_supabase.dart';
import '../../domain/entities/usuario.dart';

// Provider do repositório
final cadastroRepoProvider = Provider<CadastroRepoSupabase>((ref) {
  return CadastroRepoSupabase();
});

// Estado do cadastro
enum CadastroStatus { inicial, carregando, sucesso, erro }

class CadastroState {
  final CadastroStatus status;
  final Usuario? usuario;
  final String? mensagemErro;

  const CadastroState({
    this.status = CadastroStatus.inicial,
    this.usuario,
    this.mensagemErro,
  });

  CadastroState copyWith({
    CadastroStatus? status,
    Usuario? usuario,
    String? mensagemErro,
  }) {
    return CadastroState(
      status: status ?? this.status,
      usuario: usuario ?? this.usuario,
      mensagemErro: mensagemErro,
    );
  }
}

// Notifier para ações de cadastro
class CadastroNotifier extends StateNotifier<CadastroState> {
  final CadastroRepoSupabase _repo;

  CadastroNotifier(this._repo) : super(const CadastroState());

  /// Realiza o cadastro de um novo usuário
  Future<bool> cadastrar({
    required String nome,
    required String email,
    required String senha,
    String? telefone,
  }) async {
    state = state.copyWith(status: CadastroStatus.carregando);

    try {
      final usuario = await _repo.cadastrar(
        nome: nome,
        email: email,
        senha: senha,
        telefone: telefone,
      );

      state = state.copyWith(
        status: CadastroStatus.sucesso,
        usuario: usuario,
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        status: CadastroStatus.erro,
        mensagemErro: e.toString().replaceAll('Exception: ', ''),
      );
      return false;
    }
  }

  /// Verifica se o email já está cadastrado
  Future<bool> verificarEmailExistente(String email) async {
    return await _repo.emailJaCadastrado(email);
  }

  /// Limpa o estado
  void limpar() {
    state = const CadastroState();
  }
}

// Provider do notifier de cadastro
final cadastroProvider =
    StateNotifierProvider<CadastroNotifier, CadastroState>((ref) {
  final repo = ref.watch(cadastroRepoProvider);
  return CadastroNotifier(repo);
});

// Provider para buscar o usuário atual logado
final usuarioAtualProvider = FutureProvider<Usuario?>((ref) async {
  final repo = ref.watch(cadastroRepoProvider);
  return await repo.getUsuarioAtual();
});

// Provider para verificar se o usuário tem acesso (trial ou premium)
final temAcessoProvider = FutureProvider<bool>((ref) async {
  final usuario = await ref.watch(usuarioAtualProvider.future);

  if (usuario == null) {
    debugPrint('🔒 temAcessoProvider: usuário é null');
    return false;
  }

  final now = DateTime.now();
  debugPrint('🔍 temAcessoProvider DEBUG:');
  debugPrint('   - Email: ${usuario.email}');
  debugPrint('   - isPremium: ${usuario.isPremium}');
  debugPrint('   - trialEndsAt: ${usuario.trialEndsAt}');
  debugPrint('   - Agora: $now');
  debugPrint('   - isTrialActive: ${usuario.isTrialActive}');
  debugPrint('   - hasAccess: ${usuario.hasAccess}');

  return usuario.hasAccess;
});

// Provider para dias restantes do trial
final diasTrialRestantesProvider = FutureProvider<int>((ref) async {
  final usuario = await ref.watch(usuarioAtualProvider.future);
  return usuario?.trialDaysRemaining ?? 0;
});
