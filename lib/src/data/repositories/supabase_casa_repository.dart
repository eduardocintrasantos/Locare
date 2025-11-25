// src/data/repositories/supabase_casa_repository.dart
// Repositório para Casas usando Supabase

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:logging/logging.dart';
import '../../domain/entities/casa.dart';

final log = Logger('CasaRepository');

class SupabaseCasaRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String _tableName = 'TCASAS';

  // Buscar todas as casas
  Future<List<Casa>> getAll() async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .order('created_at', ascending: false);

      return (response as List).map((json) => _fromJson(json)).toList();
    } catch (e) {
      log.severe('❌ Erro ao buscar casas: $e');
      rethrow;
    }
  }

  // Buscar por ID
  Future<Casa?> getById(int id) async {
    try {
      final response =
          await _supabase.from(_tableName).select().eq('id', id).maybeSingle();

      if (response == null) return null;
      return _fromJson(response);
    } catch (e) {
      log.severe('❌ Erro ao buscar casa #$id: $e');
      rethrow;
    }
  }

  // Buscar casas por imobiliária
  Future<List<Casa>> getByImobiliaria(int imobiliariaId) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .eq('imobiliaria_id', imobiliariaId)
          .order('created_at', ascending: false);

      return (response as List).map((json) => _fromJson(json)).toList();
    } catch (e) {
      log.severe('❌ Erro ao buscar casas da imobiliária #$imobiliariaId: $e');
      rethrow;
    }
  }

  // Criar nova casa
  Future<Casa> create(Casa casa) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .insert({
            'descricao': casa.descricao,
            'rua': casa.rua,
            'numero': casa.numero,
            'cep': casa.cep,
            'bairro': casa.bairro,
            'imobiliaria_id': casa.imobiliariaId,
          })
          .select()
          .single();

      log.info('✅ Casa criada: ${response['descricao']}');
      return _fromJson(response);
    } catch (e) {
      log.severe('❌ Erro ao criar casa: $e');
      rethrow;
    }
  }

  // Atualizar casa
  Future<Casa> update(Casa casa) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .update({
            'descricao': casa.descricao,
            'rua': casa.rua,
            'numero': casa.numero,
            'cep': casa.cep,
            'bairro': casa.bairro,
            'imobiliaria_id': casa.imobiliariaId,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', casa.id)
          .select()
          .single();

      log.info('✅ Casa atualizada: ${response['descricao']}');
      return _fromJson(response);
    } catch (e) {
      log.severe('❌ Erro ao atualizar casa: $e');
      rethrow;
    }
  }

  // Deletar casa
  Future<void> delete(int id) async {
    try {
      await _supabase.from(_tableName).delete().eq('id', id);
      log.info('✅ Casa deletada: #$id');
    } catch (e) {
      log.severe('❌ Erro ao deletar casa: $e');
      rethrow;
    }
  }

  // Converter JSON do Supabase para Casa
  Casa _fromJson(Map<String, dynamic> json) {
    return Casa()
      ..id = json['id']
      ..descricao = json['descricao'] ?? ''
      ..rua = json['rua']
      ..numero = json['numero']
      ..cep = json['cep']
      ..bairro = json['bairro']
      ..imobiliariaId = json['imobiliaria_id']
      ..createdAt = DateTime.parse(json['created_at'])
      ..updatedAt = json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null;
  }
}
