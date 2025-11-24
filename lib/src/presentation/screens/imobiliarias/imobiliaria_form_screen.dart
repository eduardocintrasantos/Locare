// Formulário de Imobiliária com Formz (nome*). Exibe "Alterado em" se updatedAt != null.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../domain/entities/imobiliaria.dart';
import '../../../presentation/providers/imobiliaria_providers.dart';
import '../../../core/formz_inputs/non_empty_input.dart';
import '../../../core/utils/id.dart';
import '../../providers/_repos_provider.dart';
import '../../../data/api/post/imobiliaria.dart';

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
  bool _isSaving = false;

  // Máscaras
  final cnpjMask = MaskTextInputFormatter(
    mask: '##.###.###/####-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final cepMask = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {"#": RegExp(r'[0-9]')},
  );

  // Telefone com DDD automático (16)
  final telMask = MaskTextInputFormatter(
    mask: '(16) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  // Máscara alternativa para telefone (caso usuário apague DDD)
  final telMaskAlt = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

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

      // Aplicar máscaras nos campos
      if (m.cnpj != null && m.cnpj!.isNotEmpty) {
        cnpjMask.updateMask(
            mask: '##.###.###/####-##', filter: {"#": RegExp(r'[0-9]')});
        cnpjCtrl.text = cnpjMask.maskText(m.cnpj!);
      }

      ruaCtrl.text = m.rua ?? '';

      if (m.cep != null && m.cep!.isNotEmpty) {
        cepMask.updateMask(mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});
        cepCtrl.text = cepMask.maskText(m.cep!);
      }

      bairroCtrl.text = m.bairro ?? '';
      numeroCtrl.text = m.numero ?? '';

      if (m.telefone != null && m.telefone!.isNotEmpty) {
        telMaskAlt.updateMask(
            mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});
        telCtrl.text = telMaskAlt.maskText(m.telefone!);
      }

      contatoCtrl.text = m.nomeContato ?? '';
    }

    setState(() {
      _loaded = m;
    });
  }

  bool get isValid => nome.valid;

  @override
  Widget build(BuildContext context) {
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
                controller: cnpjCtrl,
                keyboardType: TextInputType.number,
                inputFormatters: [cnpjMask]),
            TextField(
                decoration: const InputDecoration(labelText: 'Rua'),
                controller: ruaCtrl),
            Row(
              children: [
                Expanded(
                    child: TextField(
                        decoration: const InputDecoration(labelText: 'CEP'),
                        controller: cepCtrl,
                        keyboardType: TextInputType.number,
                        inputFormatters: [cepMask])),
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
                        controller: numeroCtrl,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ])),
                const SizedBox(width: 8),
                Expanded(
                    child: TextField(
                        decoration: const InputDecoration(
                            labelText: 'Telefone', hintText: '(16) 99999-9999'),
                        controller: telCtrl,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [telMaskAlt],
                        onChanged: (value) {
                          // Se começar com (16), usa máscara com DDD fixo
                          if (value.startsWith('(16)')) {
                            setState(() {
                              telCtrl.value = telMask.updateMask(
                                  mask: '(16) #####-####',
                                  filter: {"#": RegExp(r'[0-9]')});
                            });
                          }
                        })),
              ],
            ),
            TextField(
                decoration: const InputDecoration(labelText: 'Nome contato'),
                controller: contatoCtrl),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _isSaving
                  ? null
                  : () async {
                      if (!_formKey.currentState!.validate()) return;

                      setState(() => _isSaving = true);

                      final m = (_loaded ?? Imobiliaria())
                        ..nome = nomeCtrl.text.trim()
                        ..cnpj = cnpjCtrl.text.trim().isEmpty
                            ? null
                            : cnpjMask.getUnmaskedText()
                        ..rua = ruaCtrl.text.trim().isEmpty
                            ? null
                            : ruaCtrl.text.trim()
                        ..cep = cepCtrl.text.trim().isEmpty
                            ? null
                            : cepMask.getUnmaskedText()
                        ..bairro = bairroCtrl.text.trim().isEmpty
                            ? null
                            : bairroCtrl.text.trim()
                        ..numero = numeroCtrl.text.trim().isEmpty
                            ? null
                            : numeroCtrl.text.trim()
                        ..telefone = telCtrl.text.trim().isEmpty
                            ? null
                            : telMaskAlt.getUnmaskedText()
                        ..nomeContato = contatoCtrl.text.trim().isEmpty
                            ? null
                            : contatoCtrl.text.trim();

                      // Salva localmente primeiro
                      try {
                        await ref
                            .read(imobiliariaActionsProvider.notifier)
                            .save(m);

                        // Depois tenta salvar na API (se falhar, não tem problema)
                        try {
                          final imobiliariaMap = {
                            "id": m.id,
                            "nome": m.nome,
                            "cnpj": m.cnpj,
                            "rua": m.rua,
                            "cep": m.cep,
                            "bairro": m.bairro,
                            "numero": m.numero,
                            "telefone": m.telefone,
                            "nomeContato": m.nomeContato,
                          };
                          await salvarImobiliaria(imobiliariaMap);
                        } catch (e) {
                          print('Falha ao salvar na API: $e');
                        }

                        if (mounted) Navigator.pop(context);
                      } catch (e) {
                        if (mounted) {
                          setState(() => _isSaving = false);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Erro ao salvar localmente: $e')),
                          );
                        }
                      }
                    },
              child: _isSaving
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.save_outlined),
                        SizedBox(width: 8),
                        Text('Salvar'),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
