// src/data/repositories/cadastro_repo_supabase.dart
// Repositório para cadastro de novos usuários no Supabase.

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:logging/logging.dart';
import '../../domain/entities/usuario.dart';

final _log = Logger('CadastroRepoSupabase');

class CadastroRepoSupabase {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String _tableName = 'tusuarios';

  /// Cadastra um novo usuário no Supabase Auth.
  /// O perfil na tabela tusuarios é criado automaticamente pelo trigger do banco.
  /// Retorna o Usuario criado ou lança exceção em caso de erro.
  Future<Usuario> cadastrar({
    required String nome,
    required String email,
    required String senha,
    String? telefone,
  }) async {
    try {
      // 1. Criar usuário no Supabase Auth
      // O trigger "on_auth_user_created" no banco cria automaticamente o perfil em tusuarios
      final authResponse = await _supabase.auth.signUp(
        email: email,
        password: senha,
        data: {
          'nome': nome,
          'telefone': telefone,
        },
      );

      if (authResponse.user == null) {
        throw Exception('Erro ao criar usuário no sistema de autenticação');
      }

      final userId = authResponse.user!.id;

      _log.info('✅ Usuário cadastrado no Auth: $email');

      // 2. Aguardar um momento para o trigger criar o perfil
      await Future.delayed(const Duration(milliseconds: 500));

      // 3. Buscar o perfil criado pelo trigger
      final response = await _supabase
          .from(_tableName)
          .select()
          .eq('id', userId)
          .maybeSingle();

      if (response != null) {
        _log.info('✅ Perfil encontrado: $email');
        return _fromJson(response);
      }

      // Se o trigger não criou (fallback), retorna um usuário básico
      _log.warning('⚠️ Perfil não encontrado, usando dados do Auth');
      return Usuario()
        ..id = userId
        ..nome = nome
        ..email = email
        ..telefone = telefone
        ..trialEndsAt = DateTime.now().add(const Duration(days: 7))
        ..isPremium = false
        ..createdAt = DateTime.now();
    } on AuthException catch (e) {
      _log.severe('❌ Erro de autenticação no cadastro: ${e.message}');

      // Tratamento de erros específicos do Supabase Auth
      if (e.message.contains('already registered') ||
          e.message.contains('already exists')) {
        throw Exception('Este email já está cadastrado');
      }
      if (e.message.contains('weak password') ||
          e.message.contains('password')) {
        throw Exception('A senha deve ter no mínimo 6 caracteres');
      }
      if (e.message.contains('invalid email')) {
        throw Exception('Email inválido');
      }

      throw Exception('Erro no cadastro: ${e.message}');
    } catch (e) {
      _log.severe('❌ Erro ao cadastrar usuário: $e');
      rethrow;
    }
  }

  /// Busca o perfil do usuário atual
  Future<Usuario?> getUsuarioAtual() async {
    try {
      final user = _supabase.auth.currentUser;
      if (user == null) return null;

      final response = await _supabase
          .from(_tableName)
          .select()
          .eq('id', user.id)
          .maybeSingle();

      if (response == null) return null;
      return _fromJson(response);
    } catch (e) {
      _log.severe('❌ Erro ao buscar usuário atual: $e');
      rethrow;
    }
  }

  /// Busca usuário por ID
  Future<Usuario?> getById(String id) async {
    try {
      final response =
          await _supabase.from(_tableName).select().eq('id', id).maybeSingle();

      if (response == null) return null;
      return _fromJson(response);
    } catch (e) {
      _log.severe('❌ Erro ao buscar usuário #$id: $e');
      rethrow;
    }
  }

  /// Atualiza dados do perfil do usuário
  Future<Usuario> atualizarPerfil({
    required String id,
    String? nome,
    String? telefone,
  }) async {
    try {
      final updates = <String, dynamic>{
        'updated_at': DateTime.now().toIso8601String(),
      };

      if (nome != null) updates['nome'] = nome;
      if (telefone != null) updates['telefone'] = telefone;

      final response = await _supabase
          .from(_tableName)
          .update(updates)
          .eq('id', id)
          .select()
          .single();

      _log.info('✅ Perfil atualizado: $id');
      return _fromJson(response);
    } catch (e) {
      _log.severe('❌ Erro ao atualizar perfil: $e');
      rethrow;
    }
  }

  /// Verifica se o email já está cadastrado
  Future<bool> emailJaCadastrado(String email) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select('id')
          .eq('email', email)
          .maybeSingle();

      return response != null;
    } catch (e) {
      _log.severe('❌ Erro ao verificar email: $e');
      return false;
    }
  }

  Usuario _fromJson(Map<String, dynamic> json) {
    return Usuario()
      ..id = json['id'] ?? ''
      ..nome = json['nome'] ?? ''
      ..email = json['email'] ?? ''
      ..telefone = json['telefone']
      ..trialEndsAt = json['trial_ends_at'] != null
          ? DateTime.parse(json['trial_ends_at'])
          : DateTime.now().add(const Duration(days: 7))
      ..isPremium = json['is_premium'] ?? false
      ..premiumExpiresAt = json['premium_expires_at'] != null
          ? DateTime.parse(json['premium_expires_at'])
          : null
      ..createdAt = json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now()
      ..updatedAt = json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null;
  }
}
