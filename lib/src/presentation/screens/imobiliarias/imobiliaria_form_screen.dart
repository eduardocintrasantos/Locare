// Formulário de Imobiliária com Formz (nome*). Exibe "Alterado em" se updatedAt != null.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/imobiliaria.dart';
import '../../../presentation/providers/imobiliaria_providers.dart';
import '../../../core/formz_inputs/non_empty_input.dart';
import '../../../core/utils/id.dart';
import '../../providers/_repos_provider.dart';

class ImobiliariaFormScreen extends ConsumerStatefulWidget {
  final int? id;
  const ImobiliariaFormScreen({super.key, this.id});

  @override
  ConsumerState<ImobiliariaFormScreen> createState() =>
      _ImobiliariaFormScreenState();
}

class _ImobiliariaFormScreenState extends ConsumerState<ImobiliariaFormScreen> {
  final _formKey = GlobalKey<FormState>();
  var nome = const NonEmptyInput.pure();
  final nomeCtrl = TextEditingController();
  final cnpjCtrl = TextEditingController();
  final ruaCtrl = TextEditingController();
  final cepCtrl = TextEditingController();
  final bairroCtrl = TextEditingController();
  final numeroCtrl = TextEditingController();
  final telCtrl = TextEditingController();
  final contatoCtrl = TextEditingController();
  Imobiliaria? _loaded;

  @override
  void initState() {
    super.initState();
    _loadIfNeeded();
  }

  @override
  void dispose() {
    nomeCtrl.dispose();
    cnpjCtrl.dispose();
    ruaCtrl.dispose();
    cepCtrl.dispose();
    bairroCtrl.dispose();
    numeroCtrl.dispose();
    telCtrl.dispose();
    contatoCtrl.dispose();
    super.dispose();
  }

  Future<void> _loadIfNeeded() async {
    if (widget.id == null) return;
    final repo = ref.read(imobiliariaRepoProvider);
    final m = await repo.getById(widget.id!);
    if (!mounted) return;

    // Preencher todos os controllers ANTES do setState para evitar conflitos
    if (m != null) {
      nomeCtrl.text = m.nome;
      nome = NonEmptyInput.dirty(m.nome);
      cnpjCtrl.text = m.cnpj ?? '';
      ruaCtrl.text = m.rua ?? '';
      cepCtrl.text = m.cep ?? '';
      bairroCtrl.text = m.bairro ?? '';
      numeroCtrl.text = m.numero ?? '';
      telCtrl.text = m.telefone ?? '';
      contatoCtrl.text = m.nomeContato ?? '';
    }

    setState(() {
      _loaded = m;
    });
  }

  bool get isValid => nome.valid;

  @override
  Widget build(BuildContext context) {
    final saving = ref.watch(imobiliariaActionsProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
          title: Text(
              widget.id == null ? 'Nova Imobiliária' : 'Editar Imobiliária')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (_loaded?.updatedAt != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Alterado em ${formatDateTime(_loaded!.updatedAt!)}',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome *'),
              controller: nomeCtrl,
              onChanged: (v) => setState(() => nome = NonEmptyInput.dirty(v)),
              validator: (_) => nome.invalid ? 'Obrigatório' : null,
            ),
            TextField(
                decoration: const InputDecoration(labelText: 'CNPJ'),
                controller: cnpjCtrl),
            TextField(
                decoration: const InputDecoration(labelText: 'Rua'),
                controller: ruaCtrl),
            Row(
              children: [
                Expanded(
                    child: TextField(
                        decoration: const InputDecoration(labelText: 'CEP'),
                        controller: cepCtrl)),
                const SizedBox(width: 8),
                Expanded(
                    child: TextField(
                        decoration: const InputDecoration(labelText: 'Bairro'),
                        controller: bairroCtrl)),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                        decoration: const InputDecoration(labelText: 'Número'),
                        controller: numeroCtrl)),
                const SizedBox(width: 8),
                Expanded(
                    child: TextField(
                        decoration:
                            const InputDecoration(labelText: 'Telefone'),
                        controller: telCtrl)),
              ],
            ),
            TextField(
                decoration: const InputDecoration(labelText: 'Nome contato'),
                controller: contatoCtrl),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: saving
                  ? null
                  : () async {
                      if (!_formKey.currentState!.validate()) return;
                      try {
                        // Se é novo cadastro, não seta ID (Isar.autoIncrement cuida disso)
                        final m = (_loaded ?? Imobiliaria())
                          ..nome = nomeCtrl.text.trim()
                          ..cnpj = cnpjCtrl.text.trim().isEmpty
                              ? null
                              : cnpjCtrl.text.trim()
                          ..rua = ruaCtrl.text.trim().isEmpty
                              ? null
                              : ruaCtrl.text.trim()
                          ..cep = cepCtrl.text.trim().isEmpty
                              ? null
                              : cepCtrl.text.trim()
                          ..bairro = bairroCtrl.text.trim().isEmpty
                              ? null
                              : bairroCtrl.text.trim()
                          ..numero = numeroCtrl.text.trim().isEmpty
                              ? null
                              : numeroCtrl.text.trim()
                          ..telefone = telCtrl.text.trim().isEmpty
                              ? null
                              : telCtrl.text.trim()
                          ..nomeContato = contatoCtrl.text.trim().isEmpty
                              ? null
                              : contatoCtrl.text.trim();
                        await ref
                            .read(imobiliariaActionsProvider.notifier)
                            .save(m);
                        if (mounted) Navigator.pop(context);
                      } catch (e) {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Erro ao salvar: $e')),
                          );
                        }
                      }
                    },
              icon: const Icon(Icons.save_outlined),
              label: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
