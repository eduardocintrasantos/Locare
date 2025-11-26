// src/data/repositories/imobiliaria_repo_supabase.dart
// Implementação Supabase do repositório de Imobiliaria.

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:logging/logging.dart';
import '../../domain/entities/imobiliaria.dart';
import '../../domain/repositories/imobiliaria_repo.dart';
import '../../core/auth/auth_service.dart';

final _log = Logger('ImobiliariaRepoSupabase');

class ImobiliariaRepoSupabase implements ImobiliariaRepo {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String _tableName = 'timobiliarias';

  @override
  Future<List<Imobiliaria>> list() async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .order('created_at', ascending: false);

      return (response as List).map((json) => _fromJson(json)).toList();
    } catch (e) {
      _log.severe('❌ Erro ao buscar imobiliárias: $e');
      rethrow;
    }
  }

  @override
  Future<Imobiliaria?> getById(int id) async {
    try {
      final response =
          await _supabase.from(_tableName).select().eq('id', id).maybeSingle();

      if (response == null) return null;
      return _fromJson(response);
    } catch (e) {
      _log.severe('❌ Erro ao buscar imobiliária #$id: $e');
      rethrow;
    }
  }

  @override
  Future<int> upsert(Imobiliaria model) async {
    try {
      final userId = AuthService.currentUserId;
      if (userId == null) {
        throw Exception('Usuário não está autenticado!');
      }

      if (model.id == 0) {
        // Criar novo
        final response = await _supabase
            .from(_tableName)
            .insert({
              'nome': model.nome,
              'cnpj': model.cnpj,
              'rua': model.rua,
              'cep': model.cep,
              'bairro': model.bairro,
              'numero': model.numero,
              'telefone': model.telefone,
              'nome_contato': model.nomeContato,
              'usuario_id': userId,
            })
            .select()
            .single();

        _log.info('✅ Imobiliária criada: ${response['nome']}');
        return response['id'] as int;
      } else {
        // Atualizar existente
        await _supabase.from(_tableName).update({
          'nome': model.nome,
          'cnpj': model.cnpj,
          'rua': model.rua,
          'cep': model.cep,
          'bairro': model.bairro,
          'numero': model.numero,
          'telefone': model.telefone,
          'nome_contato': model.nomeContato,
          'updated_at': DateTime.now().toIso8601String(),
        }).eq('id', model.id);

        _log.info('✅ Imobiliária atualizada: ${model.nome}');
        return model.id;
      }
    } catch (e) {
      _log.severe('❌ Erro ao salvar imobiliária: $e');
      rethrow;
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await _supabase.from(_tableName).delete().eq('id', id);
      _log.info('✅ Imobiliária deletada: #$id');
    } catch (e) {
      _log.severe('❌ Erro ao deletar imobiliária: $e');
      rethrow;
    }
  }

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
