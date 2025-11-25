// src/data/repositories/pagamento_repo_supabase.dart
// Implementação Supabase do repositório de Pagamento.

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:logging/logging.dart';
import '../../domain/entities/pagamento.dart';
import '../../domain/repositories/pagamento_repo.dart';

final _log = Logger('PagamentoRepoSupabase');

class PagamentoRepoSupabase implements PagamentoRepo {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String _tableName = 'tpagamentos';

  @override
  Future<Pagamento?> getByVinculoAnoMes(int vinculoId, int ano, int mes) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .eq('vinculo_id', vinculoId)
          .eq('ano', ano)
          .eq('mes', mes)
          .maybeSingle();

      if (response == null) return null;
      return _fromJson(response);
    } catch (e) {
      _log.severe('❌ Erro ao buscar pagamento: $e');
      rethrow;
    }
  }

  @override
  Future<Pagamento> marcarRecebido(int vinculoId, int ano, int mes) async {
    try {
      // Verificar se já existe
      final existing = await getByVinculoAnoMes(vinculoId, ano, mes);

      if (existing != null) {
        // Atualizar existente
        final response = await _supabase
            .from(_tableName)
            .update({
              'recebido': true,
              'recebido_em': DateTime.now().toIso8601String(),
              'updated_at': DateTime.now().toIso8601String(),
            })
            .eq('id', existing.id)
            .select()
            .single();

        _log.info('✅ Pagamento marcado como recebido: $mes/$ano');
        return _fromJson(response);
      } else {
        // Criar novo como recebido
        final response = await _supabase
            .from(_tableName)
            .insert({
              'vinculo_id': vinculoId,
              'ano': ano,
              'mes': mes,
              'recebido': true,
              'recebido_em': DateTime.now().toIso8601String(),
            })
            .select()
            .single();

        _log.info('✅ Pagamento criado como recebido: $mes/$ano');
        return _fromJson(response);
      }
    } catch (e) {
      _log.severe('❌ Erro ao marcar pagamento como recebido: $e');
      rethrow;
    }
  }

  @override
  Future<Pagamento> estornar(int vinculoId, int ano, int mes) async {
    try {
      final existing = await getByVinculoAnoMes(vinculoId, ano, mes);

      if (existing != null) {
        // Atualizar para não recebido
        final response = await _supabase
            .from(_tableName)
            .update({
              'recebido': false,
              'recebido_em': null,
              'updated_at': DateTime.now().toIso8601String(),
            })
            .eq('id', existing.id)
            .select()
            .single();

        _log.info('✅ Pagamento estornado: $mes/$ano');
        return _fromJson(response);
      } else {
        // Criar novo como não recebido
        final response = await _supabase
            .from(_tableName)
            .insert({
              'vinculo_id': vinculoId,
              'ano': ano,
              'mes': mes,
              'recebido': false,
              'recebido_em': null,
            })
            .select()
            .single();

        _log.info('✅ Pagamento criado como não recebido: $mes/$ano');
        return _fromJson(response);
      }
    } catch (e) {
      _log.severe('❌ Erro ao estornar pagamento: $e');
      rethrow;
    }
  }

  @override
  Future<List<Pagamento>> listByAnoMes(
      {required int ano, required int mes}) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .eq('ano', ano)
          .eq('mes', mes)
          .order('vinculo_id', ascending: true);

      return (response as List).map((json) => _fromJson(json)).toList();
    } catch (e) {
      _log.severe('❌ Erro ao buscar pagamentos de $mes/$ano: $e');
      rethrow;
    }
  }

  Pagamento _fromJson(Map<String, dynamic> json) {
    return Pagamento()
      ..id = json['id']
      ..vinculoId = json['vinculo_id']
      ..ano = json['ano']
      ..mes = json['mes']
      ..recebido = json['recebido'] ?? false
      ..recebidoEm = json['recebido_em'] != null
          ? DateTime.parse(json['recebido_em'])
          : null
      ..createdAt = DateTime.parse(json['created_at'])
      ..updatedAt = json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null;
  }
}
