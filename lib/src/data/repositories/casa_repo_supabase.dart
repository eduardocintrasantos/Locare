// src/data/repositories/casa_repo_supabase.dart
// Implementação Supabase do repositório de Casa.

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:logging/logging.dart';
import '../../domain/entities/casa.dart';
import '../../domain/repositories/casa_repo.dart';

final _log = Logger('CasaRepoSupabase');

class CasaRepoSupabase implements CasaRepo {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String _tableName = 'tcasas';

  @override
  Future<List<Casa>> list({int? imobiliariaId}) async {
    try {
      var query = _supabase.from(_tableName).select();

      if (imobiliariaId != null) {
        query = query.eq('imobiliaria_id', imobiliariaId);
      }

      final response = await query.order('created_at', ascending: false);

      return (response as List).map((json) => _fromJson(json)).toList();
    } catch (e) {
      _log.severe('❌ Erro ao buscar casas: $e');
      rethrow;
    }
  }

  @override
  Future<Casa?> getById(int id) async {
    try {
      final response =
          await _supabase.from(_tableName).select().eq('id', id).maybeSingle();

      if (response == null) return null;
      return _fromJson(response);
    } catch (e) {
      _log.severe('❌ Erro ao buscar casa #$id: $e');
      rethrow;
    }
  }

  @override
  Future<int> upsert(Casa model) async {
    try {
      if (model.id == 0) {
        // Criar novo
        final response = await _supabase
            .from(_tableName)
            .insert({
              'descricao': model.descricao,
              'rua': model.rua,
              'numero': model.numero,
              'cep': model.cep,
              'bairro': model.bairro,
              'imobiliaria_id': model.imobiliariaId,
            })
            .select()
            .single();

        _log.info('✅ Casa criada: ${response['descricao']}');
        return response['id'] as int;
      } else {
        // Atualizar existente
        await _supabase.from(_tableName).update({
          'descricao': model.descricao,
          'rua': model.rua,
          'numero': model.numero,
          'cep': model.cep,
          'bairro': model.bairro,
          'imobiliaria_id': model.imobiliariaId,
          'updated_at': DateTime.now().toIso8601String(),
        }).eq('id', model.id);

        _log.info('✅ Casa atualizada: ${model.descricao}');
        return model.id;
      }
    } catch (e) {
      _log.severe('❌ Erro ao salvar casa: $e');
      rethrow;
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await _supabase.from(_tableName).delete().eq('id', id);
      _log.info('✅ Casa deletada: #$id');
    } catch (e) {
      _log.severe('❌ Erro ao deletar casa: $e');
      rethrow;
    }
  }

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
