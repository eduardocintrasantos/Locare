// src/data/repositories/supabase_vinculo_repository.dart
// Repositório para Vínculos usando Supabase

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:logging/logging.dart';
import '../../domain/entities/vinculo.dart';

final log = Logger('VinculoRepository');

class SupabaseVinculoRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String _tableName = 'TVINCULOS';

  // Buscar todos os vínculos
  Future<List<Vinculo>> getAll() async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .order('created_at', ascending: false);

      return (response as List).map((json) => _fromJson(json)).toList();
    } catch (e) {
      log.severe('❌ Erro ao buscar vínculos: $e');
      rethrow;
    }
  }

  // Buscar vínculos ativos
  Future<List<Vinculo>> getAtivos() async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .isFilter('fim', null)
          .order('created_at', ascending: false);

      return (response as List).map((json) => _fromJson(json)).toList();
    } catch (e) {
      log.severe('❌ Erro ao buscar vínculos ativos: $e');
      rethrow;
    }
  }

  // Buscar por ID
  Future<Vinculo?> getById(int id) async {
    try {
      final response =
          await _supabase.from(_tableName).select().eq('id', id).maybeSingle();

      if (response == null) return null;
      return _fromJson(response);
    } catch (e) {
      log.severe('❌ Erro ao buscar vínculo #$id: $e');
      rethrow;
    }
  }

  // Buscar vínculos por casa
  Future<List<Vinculo>> getByCasa(int casaId) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .eq('casa_id', casaId)
          .order('created_at', ascending: false);

      return (response as List).map((json) => _fromJson(json)).toList();
    } catch (e) {
      log.severe('❌ Erro ao buscar vínculos da casa #$casaId: $e');
      rethrow;
    }
  }

  // Buscar vínculos por locatário
  Future<List<Vinculo>> getByLocatario(int locatarioId) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .eq('locatario_id', locatarioId)
          .order('created_at', ascending: false);

      return (response as List).map((json) => _fromJson(json)).toList();
    } catch (e) {
      log.severe('❌ Erro ao buscar vínculos do locatário #$locatarioId: $e');
      rethrow;
    }
  }

  // Criar novo vínculo
  Future<Vinculo> create(Vinculo vinculo) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .insert({
            'casa_id': vinculo.casaId,
            'imobiliaria_id': vinculo.imobiliariaId,
            'locatario_id': vinculo.locatarioId,
            'valor_aluguel': vinculo.valorAluguel,
            'taxa_percent': vinculo.taxaPercent,
            'taxa_valor': vinculo.taxaValor,
            'inicio': vinculo.inicio.toIso8601String(),
            'fim': vinculo.fim?.toIso8601String(),
          })
          .select()
          .single();

      log.info('✅ Vínculo criado: #${response['id']}');
      return _fromJson(response);
    } catch (e) {
      log.severe('❌ Erro ao criar vínculo: $e');
      rethrow;
    }
  }

  // Atualizar vínculo
  Future<Vinculo> update(Vinculo vinculo) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .update({
            'casa_id': vinculo.casaId,
            'imobiliaria_id': vinculo.imobiliariaId,
            'locatario_id': vinculo.locatarioId,
            'valor_aluguel': vinculo.valorAluguel,
            'taxa_percent': vinculo.taxaPercent,
            'taxa_valor': vinculo.taxaValor,
            'inicio': vinculo.inicio.toIso8601String(),
            'fim': vinculo.fim?.toIso8601String(),
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', vinculo.id)
          .select()
          .single();

      log.info('✅ Vínculo atualizado: #${response['id']}');
      return _fromJson(response);
    } catch (e) {
      log.severe('❌ Erro ao atualizar vínculo: $e');
      rethrow;
    }
  }

  // Deletar vínculo
  Future<void> delete(int id) async {
    try {
      await _supabase.from(_tableName).delete().eq('id', id);
      log.info('✅ Vínculo deletado: #$id');
    } catch (e) {
      log.severe('❌ Erro ao deletar vínculo: $e');
      rethrow;
    }
  }

  // Encerrar vínculo (definir data fim)
  Future<Vinculo> encerrar(int id, DateTime dataFim) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .update({
            'fim': dataFim.toIso8601String(),
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', id)
          .select()
          .single();

      log.info('✅ Vínculo encerrado: #$id');
      return _fromJson(response);
    } catch (e) {
      log.severe('❌ Erro ao encerrar vínculo: $e');
      rethrow;
    }
  }

  // Converter JSON do Supabase para Vinculo
  Vinculo _fromJson(Map<String, dynamic> json) {
    return Vinculo()
      ..id = json['id']
      ..casaId = json['casa_id']
      ..imobiliariaId = json['imobiliaria_id']
      ..locatarioId = json['locatario_id']
      ..valorAluguel = json['valor_aluguel'] != null
          ? (json['valor_aluguel'] as num).toDouble()
          : null
      ..taxaPercent = json['taxa_percent'] != null
          ? (json['taxa_percent'] as num).toDouble()
          : null
      ..taxaValor = json['taxa_valor'] != null
          ? (json['taxa_valor'] as num).toDouble()
          : null
      ..inicio = DateTime.parse(json['inicio'])
      ..fim = json['fim'] != null ? DateTime.parse(json['fim']) : null
      ..createdAt = DateTime.parse(json['created_at'])
      ..updatedAt = json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null;
  }
}
