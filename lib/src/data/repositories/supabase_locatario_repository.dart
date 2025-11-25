// src/data/repositories/supabase_locatario_repository.dart
// Repositório para Locatários usando Supabase

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:logging/logging.dart';
import '../../domain/entities/locatario.dart';

final log = Logger('LocatarioRepository');

class SupabaseLocatarioRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String _tableName = 'TLOCATARIOS';

  // Buscar todos os locatários
  Future<List<Locatario>> getAll() async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .order('created_at', ascending: false);

      return (response as List).map((json) => _fromJson(json)).toList();
    } catch (e) {
      log.severe('❌ Erro ao buscar locatários: $e');
      rethrow;
    }
  }

  // Buscar por ID
  Future<Locatario?> getById(int id) async {
    try {
      final response =
          await _supabase.from(_tableName).select().eq('id', id).maybeSingle();

      if (response == null) return null;
      return _fromJson(response);
    } catch (e) {
      log.severe('❌ Erro ao buscar locatário #$id: $e');
      rethrow;
    }
  }

  // Criar novo locatário
  Future<Locatario> create(Locatario locatario) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .insert({
            'nome': locatario.nome,
            'cpf': locatario.cpf,
            'rg': locatario.rg,
            'telefone': locatario.telefone,
            'celular': locatario.celular,
            'fiador_nome': locatario.fiadorNome,
            'fiador_cpf': locatario.fiadorCpf,
            'fiador_rg': locatario.fiadorRg,
            'fiador_telefone': locatario.fiadorTelefone,
            'fiador_celular': locatario.fiadorCelular,
          })
          .select()
          .single();

      log.info('✅ Locatário criado: ${response['nome']}');
      return _fromJson(response);
    } catch (e) {
      log.severe('❌ Erro ao criar locatário: $e');
      rethrow;
    }
  }

  // Atualizar locatário
  Future<Locatario> update(Locatario locatario) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .update({
            'nome': locatario.nome,
            'cpf': locatario.cpf,
            'rg': locatario.rg,
            'telefone': locatario.telefone,
            'celular': locatario.celular,
            'fiador_nome': locatario.fiadorNome,
            'fiador_cpf': locatario.fiadorCpf,
            'fiador_rg': locatario.fiadorRg,
            'fiador_telefone': locatario.fiadorTelefone,
            'fiador_celular': locatario.fiadorCelular,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', locatario.id)
          .select()
          .single();

      log.info('✅ Locatário atualizado: ${response['nome']}');
      return _fromJson(response);
    } catch (e) {
      log.severe('❌ Erro ao atualizar locatário: $e');
      rethrow;
    }
  }

  // Deletar locatário
  Future<void> delete(int id) async {
    try {
      await _supabase.from(_tableName).delete().eq('id', id);
      log.info('✅ Locatário deletado: #$id');
    } catch (e) {
      log.severe('❌ Erro ao deletar locatário: $e');
      rethrow;
    }
  }

  // Converter JSON do Supabase para Locatario
  Locatario _fromJson(Map<String, dynamic> json) {
    return Locatario()
      ..id = json['id']
      ..nome = json['nome'] ?? ''
      ..cpf = json['cpf']
      ..rg = json['rg']
      ..telefone = json['telefone']
      ..celular = json['celular']
      ..fiadorNome = json['fiador_nome']
      ..fiadorCpf = json['fiador_cpf']
      ..fiadorRg = json['fiador_rg']
      ..fiadorTelefone = json['fiador_telefone']
      ..fiadorCelular = json['fiador_celular']
      ..createdAt = DateTime.parse(json['created_at'])
      ..updatedAt = json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null;
  }
}
