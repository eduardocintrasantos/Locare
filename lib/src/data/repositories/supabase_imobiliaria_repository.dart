// src/data/repositories/supabase_imobiliaria_repository.dart
// Repositório para Imobiliárias usando Supabase

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:logging/logging.dart';
import '../../domain/entities/imobiliaria.dart';

final log = Logger('ImobiliariaRepository');

class SupabaseImobiliariaRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String _tableName = 'TIMOBILIARIAS';

  // Buscar todas as imobiliárias
  Future<List<Imobiliaria>> getAll() async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .order('created_at', ascending: false);

      return (response as List).map((json) => _fromJson(json)).toList();
    } catch (e) {
      log.severe('❌ Erro ao buscar imobiliárias: $e');
      rethrow;
    }
  }

  // Buscar por ID
  Future<Imobiliaria?> getById(int id) async {
    try {
      final response =
          await _supabase.from(_tableName).select().eq('id', id).maybeSingle();

      if (response == null) return null;
      return _fromJson(response);
    } catch (e) {
      log.severe('❌ Erro ao buscar imobiliária #$id: $e');
      rethrow;
    }
  }

  // Criar nova imobiliária
  Future<Imobiliaria> create(Imobiliaria imobiliaria) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .insert({
            'nome': imobiliaria.nome,
            'cnpj': imobiliaria.cnpj,
            'rua': imobiliaria.rua,
            'cep': imobiliaria.cep,
            'bairro': imobiliaria.bairro,
            'numero': imobiliaria.numero,
            'telefone': imobiliaria.telefone,
            'nome_contato': imobiliaria.nomeContato,
          })
          .select()
          .single();

      log.info('✅ Imobiliária criada: ${response['nome']}');
      return _fromJson(response);
    } catch (e) {
      log.severe('❌ Erro ao criar imobiliária: $e');
      rethrow;
    }
  }

  // Atualizar imobiliária
  Future<Imobiliaria> update(Imobiliaria imobiliaria) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .update({
            'nome': imobiliaria.nome,
            'cnpj': imobiliaria.cnpj,
            'rua': imobiliaria.rua,
            'cep': imobiliaria.cep,
            'bairro': imobiliaria.bairro,
            'numero': imobiliaria.numero,
            'telefone': imobiliaria.telefone,
            'nome_contato': imobiliaria.nomeContato,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', imobiliaria.id)
          .select()
          .single();

      log.info('✅ Imobiliária atualizada: ${response['nome']}');
      return _fromJson(response);
    } catch (e) {
      log.severe('❌ Erro ao atualizar imobiliária: $e');
      rethrow;
    }
  }

  // Deletar imobiliária
  Future<void> delete(int id) async {
    try {
      await _supabase.from(_tableName).delete().eq('id', id);
      log.info('✅ Imobiliária deletada: #$id');
    } catch (e) {
      log.severe('❌ Erro ao deletar imobiliária: $e');
      rethrow;
    }
  }

  // Converter JSON do Supabase para Imobiliaria
  Imobiliaria _fromJson(Map<String, dynamic> json) {
    return Imobiliaria()
      ..id = json['id']
      ..nome = json['nome'] ?? ''
      ..cnpj = json['cnpj']
      ..rua = json['rua']
      ..cep = json['cep']
      ..bairro = json['bairro']
      ..numero = json['numero']
      ..telefone = json['telefone']
      ..nomeContato = json['nome_contato']
      ..createdAt = DateTime.parse(json['created_at'])
      ..updatedAt = json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null;
  }
}
