// src/data/repositories/locatario_repo_supabase.dart
// Implementação Supabase do repositório de Locatario.

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:logging/logging.dart';
import '../../domain/entities/locatario.dart';
import '../../domain/repositories/locatario_repo.dart';

final _log = Logger('LocatarioRepoSupabase');

class LocatarioRepoSupabase implements LocatarioRepo {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String _tableName = 'tlocatarios';

  @override
  Future<List<Locatario>> list() async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .order('created_at', ascending: false);

      return (response as List).map((json) => _fromJson(json)).toList();
    } catch (e) {
      _log.severe('❌ Erro ao buscar locatários: $e');
      rethrow;
    }
  }

  @override
  Future<Locatario?> getById(int id) async {
    try {
      final response =
          await _supabase.from(_tableName).select().eq('id', id).maybeSingle();

      if (response == null) return null;
      return _fromJson(response);
    } catch (e) {
      _log.severe('❌ Erro ao buscar locatário #$id: $e');
      rethrow;
    }
  }

  @override
  Future<int> upsert(Locatario model) async {
    try {
      if (model.id == 0) {
        // Criar novo
        final response = await _supabase
            .from(_tableName)
            .insert({
              'nome': model.nome,
              'cpf': model.cpf,
              'rg': model.rg,
              'telefone': model.telefone,
              'celular': model.celular,
              'fiador_nome': model.fiadorNome,
              'fiador_cpf': model.fiadorCpf,
              'fiador_rg': model.fiadorRg,
              'fiador_telefone': model.fiadorTelefone,
              'fiador_celular': model.fiadorCelular,
            })
            .select()
            .single();

        _log.info('✅ Locatário criado: ${response['nome']}');
        return response['id'] as int;
      } else {
        // Atualizar existente
        await _supabase.from(_tableName).update({
          'nome': model.nome,
          'cpf': model.cpf,
          'rg': model.rg,
          'telefone': model.telefone,
          'celular': model.celular,
          'fiador_nome': model.fiadorNome,
          'fiador_cpf': model.fiadorCpf,
          'fiador_rg': model.fiadorRg,
          'fiador_telefone': model.fiadorTelefone,
          'fiador_celular': model.fiadorCelular,
          'updated_at': DateTime.now().toIso8601String(),
        }).eq('id', model.id);

        _log.info('✅ Locatário atualizado: ${model.nome}');
        return model.id;
      }
    } catch (e) {
      _log.severe('❌ Erro ao salvar locatário: $e');
      rethrow;
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await _supabase.from(_tableName).delete().eq('id', id);
      _log.info('✅ Locatário deletado: #$id');
    } catch (e) {
      _log.severe('❌ Erro ao deletar locatário: $e');
      rethrow;
    }
  }

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
