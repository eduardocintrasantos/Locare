// src/data/repositories/supabase_pagamento_repository.dart
// Repositório para Pagamentos usando Supabase

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:logging/logging.dart';
import '../../domain/entities/pagamento.dart';

final log = Logger('PagamentoRepository');

class SupabasePagamentoRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String _tableName = 'TPAGAMENTOS';

  // Buscar todos os pagamentos
  Future<List<Pagamento>> getAll() async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .order('ano', ascending: false)
          .order('mes', ascending: false);

      return (response as List).map((json) => _fromJson(json)).toList();
    } catch (e) {
      log.severe('❌ Erro ao buscar pagamentos: $e');
      rethrow;
    }
  }

  // Buscar pagamentos por vínculo
  Future<List<Pagamento>> getByVinculo(int vinculoId) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .eq('vinculo_id', vinculoId)
          .order('ano', ascending: false)
          .order('mes', ascending: false);

      return (response as List).map((json) => _fromJson(json)).toList();
    } catch (e) {
      log.severe('❌ Erro ao buscar pagamentos do vínculo #$vinculoId: $e');
      rethrow;
    }
  }

  // Buscar pagamentos por período
  Future<List<Pagamento>> getByPeriodo(int ano, int mes) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .eq('ano', ano)
          .eq('mes', mes);

      return (response as List).map((json) => _fromJson(json)).toList();
    } catch (e) {
      log.severe('❌ Erro ao buscar pagamentos de $mes/$ano: $e');
      rethrow;
    }
  }

  // Buscar pagamentos pendentes
  Future<List<Pagamento>> getPendentes() async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .eq('recebido', false)
          .order('ano', ascending: true)
          .order('mes', ascending: true);

      return (response as List).map((json) => _fromJson(json)).toList();
    } catch (e) {
      log.severe('❌ Erro ao buscar pagamentos pendentes: $e');
      rethrow;
    }
  }

  // Buscar por ID
  Future<Pagamento?> getById(int id) async {
    try {
      final response =
          await _supabase.from(_tableName).select().eq('id', id).maybeSingle();

      if (response == null) return null;
      return _fromJson(response);
    } catch (e) {
      log.severe('❌ Erro ao buscar pagamento #$id: $e');
      rethrow;
    }
  }

  // Criar novo pagamento
  Future<Pagamento> create(Pagamento pagamento) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .insert({
            'vinculo_id': pagamento.vinculoId,
            'ano': pagamento.ano,
            'mes': pagamento.mes,
            'recebido': pagamento.recebido,
            'recebido_em': pagamento.recebidoEm?.toIso8601String(),
          })
          .select()
          .single();

      log.info('✅ Pagamento criado: ${response['mes']}/${response['ano']}');
      return _fromJson(response);
    } catch (e) {
      log.severe('❌ Erro ao criar pagamento: $e');
      rethrow;
    }
  }

  // Atualizar pagamento
  Future<Pagamento> update(Pagamento pagamento) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .update({
            'vinculo_id': pagamento.vinculoId,
            'ano': pagamento.ano,
            'mes': pagamento.mes,
            'recebido': pagamento.recebido,
            'recebido_em': pagamento.recebidoEm?.toIso8601String(),
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', pagamento.id)
          .select()
          .single();

      log.info('✅ Pagamento atualizado: #${response['id']}');
      return _fromJson(response);
    } catch (e) {
      log.severe('❌ Erro ao atualizar pagamento: $e');
      rethrow;
    }
  }

  // Marcar como recebido
  Future<Pagamento> marcarComoRecebido(int id) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .update({
            'recebido': true,
            'recebido_em': DateTime.now().toIso8601String(),
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', id)
          .select()
          .single();

      log.info('✅ Pagamento marcado como recebido: #$id');
      return _fromJson(response);
    } catch (e) {
      log.severe('❌ Erro ao marcar pagamento como recebido: $e');
      rethrow;
    }
  }

  // Deletar pagamento
  Future<void> delete(int id) async {
    try {
      await _supabase.from(_tableName).delete().eq('id', id);
      log.info('✅ Pagamento deletado: #$id');
    } catch (e) {
      log.severe('❌ Erro ao deletar pagamento: $e');
      rethrow;
    }
  }

  // Converter JSON do Supabase para Pagamento
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
