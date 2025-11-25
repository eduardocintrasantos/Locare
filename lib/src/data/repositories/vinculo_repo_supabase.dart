// src/data/repositories/vinculo_repo_supabase.dart
// Implementação Supabase do repositório de Vinculo.

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:logging/logging.dart';
import '../../domain/entities/vinculo.dart';
import '../../domain/repositories/vinculo_repo.dart';

final _log = Logger('VinculoRepoSupabase');

class VinculoRepoSupabase implements VinculoRepo {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String _tableName = 'tvinculos';

  @override
  Future<List<Vinculo>> list({
    int? casaId,
    int? imobiliariaId,
    int? locatarioId,
    bool? apenasAtivos,
  }) async {
    try {
      var query = _supabase.from(_tableName).select();

      if (casaId != null) {
        query = query.eq('casa_id', casaId);
      }
      if (imobiliariaId != null) {
        query = query.eq('imobiliaria_id', imobiliariaId);
      }
      if (locatarioId != null) {
        query = query.eq('locatario_id', locatarioId);
      }
      if (apenasAtivos == true) {
        query = query.isFilter('fim', null);
      }

      final response = await query.order('created_at', ascending: false);

      return (response as List).map((json) => _fromJson(json)).toList();
    } catch (e) {
      _log.severe('❌ Erro ao buscar vínculos: $e');
      rethrow;
    }
  }

  @override
  Future<Vinculo?> getById(int id) async {
    try {
      final response =
          await _supabase.from(_tableName).select().eq('id', id).maybeSingle();

      if (response == null) return null;
      return _fromJson(response);
    } catch (e) {
      _log.severe('❌ Erro ao buscar vínculo #$id: $e');
      rethrow;
    }
  }

  @override
  Future<int> upsertComRegras(Vinculo model) async {
    try {
      // Se for novo vínculo, finalizar vínculos ativos anteriores da mesma casa
      if (model.id == 0) {
        // Buscar vínculos ativos da mesma casa
        final vinculosAtivos = await list(
          casaId: model.casaId,
          apenasAtivos: true,
        );

        // Finalizar cada um deles (fim = inicio do novo - 1 dia)
        final dataFim = model.inicio.subtract(const Duration(days: 1));
        for (final vinculo in vinculosAtivos) {
          await _supabase.from(_tableName).update({
            'fim': dataFim.toIso8601String(),
            'updated_at': DateTime.now().toIso8601String(),
          }).eq('id', vinculo.id);
          _log.info('✅ Vínculo #${vinculo.id} finalizado automaticamente');
        }

        // Criar novo vínculo
        final response = await _supabase
            .from(_tableName)
            .insert({
              'casa_id': model.casaId,
              'imobiliaria_id': model.imobiliariaId,
              'locatario_id': model.locatarioId,
              'valor_aluguel': model.valorAluguel,
              'taxa_percent': model.taxaPercent,
              'taxa_valor': model.taxaValor,
              'inicio': model.inicio.toIso8601String(),
              'fim': model.fim?.toIso8601String(),
            })
            .select()
            .single();

        _log.info('✅ Vínculo criado: #${response['id']}');
        return response['id'] as int;
      } else {
        // Atualizar existente
        await _supabase.from(_tableName).update({
          'casa_id': model.casaId,
          'imobiliaria_id': model.imobiliariaId,
          'locatario_id': model.locatarioId,
          'valor_aluguel': model.valorAluguel,
          'taxa_percent': model.taxaPercent,
          'taxa_valor': model.taxaValor,
          'inicio': model.inicio.toIso8601String(),
          'fim': model.fim?.toIso8601String(),
          'updated_at': DateTime.now().toIso8601String(),
        }).eq('id', model.id);

        _log.info('✅ Vínculo atualizado: #${model.id}');
        return model.id;
      }
    } catch (e) {
      _log.severe('❌ Erro ao salvar vínculo: $e');
      rethrow;
    }
  }

  @override
  Future<void> finalizar(int id) async {
    try {
      await _supabase.from(_tableName).update({
        'fim': DateTime.now().toIso8601String(),
        'updated_at': DateTime.now().toIso8601String(),
      }).eq('id', id);

      _log.info('✅ Vínculo finalizado: #$id');
    } catch (e) {
      _log.severe('❌ Erro ao finalizar vínculo: $e');
      rethrow;
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await _supabase.from(_tableName).delete().eq('id', id);
      _log.info('✅ Vínculo deletado: #$id');
    } catch (e) {
      _log.severe('❌ Erro ao deletar vínculo: $e');
      rethrow;
    }
  }

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
