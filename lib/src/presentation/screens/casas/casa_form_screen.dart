// Form de Casa: descrição* + endereço + dropdown de Imobiliária + "Alterado em".

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locare/src/data/api/post/casa.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../domain/entities/casa.dart';
import '../../../domain/entities/imobiliaria.dart';
import '../../../core/formz_inputs/non_empty_input.dart';
import '../../../core/utils/id.dart';
import '../../providers/casa_providers.dart';
import '../../providers/imobiliaria_providers.dart';
import '../../../presentation/providers/_repos_provider.dart';

class CasaFormScreen extends ConsumerStatefulWidget {
  final int? id;
  const CasaFormScreen({super.key, this.id});

  @override
  ConsumerState<CasaFormScreen> createState() => _CasaFormScreenState();
}

class _CasaFormScreenState extends ConsumerState<CasaFormScreen> {
  final _formKey = GlobalKey<FormState>();
  var descricao = const NonEmptyInput.pure();
  final descricaoCtrl = TextEditingController();
  final ruaCtrl = TextEditingController();
  final numeroCtrl = TextEditingController();
  final cepCtrl = TextEditingController();
  final bairroCtrl = TextEditingController();
  int? imobiliariaId;
  Casa? _loaded;

  // Máscara para CEP
  final cepMask = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  void initState() {
    super.initState();
    _loadIfNeeded();
  }

  @override
  void dispose() {
    descricaoCtrl.dispose();
    ruaCtrl.dispose();
    numeroCtrl.dispose();
    cepCtrl.dispose();
    bairroCtrl.dispose();
    super.dispose();
  }

  Future<void> _loadIfNeeded() async {
    if (widget.id == null) return;
    final repo = ref.read(casaRepoProvider);
    final m = await repo.getById(widget.id!);
    if (!mounted) return;

    if (m != null) {
      descricaoCtrl.text = m.descricao;
      descricao = NonEmptyInput.dirty(m.descricao);
      ruaCtrl.text = m.rua ?? '';
      numeroCtrl.text = m.numero ?? '';

      if (m.cep != null && m.cep!.isNotEmpty) {
        cepMask.updateMask(mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});
        cepCtrl.text = cepMask.maskText(m.cep!);
      }

      bairroCtrl.text = m.bairro ?? '';
      imobiliariaId = m.imobiliariaId;
    }

    setState(() {
      _loaded = m;
    });
  }

  bool get isValid => descricao.valid;

  @override
  Widget build(BuildContext context) {
    final imobs = ref.watch(imobiliariasListProvider).value ?? [];
    final saving = ref.watch(casaActionsProvider).isLoading;

    return Scaffold(
      appBar:
          AppBar(title: Text(widget.id == null ? 'Nova Casa' : 'Editar Casa')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (_loaded?.updatedAt != null)
              Text('Alterado em ${formatDateTime(_loaded!.updatedAt!)}',
                  style: const TextStyle(color: Colors.red)),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Descrição *'),
              controller: descricaoCtrl,
              onChanged: (v) =>
                  setState(() => descricao = NonEmptyInput.dirty(v)),
              validator: (_) => descricao.invalid ? 'Obrigatório' : null,
            ),
            TextField(
                decoration: const InputDecoration(labelText: 'Rua'),
                controller: ruaCtrl),
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
                        decoration: const InputDecoration(labelText: 'CEP'),
                        controller: cepCtrl,
                        keyboardType: TextInputType.number,
                        inputFormatters: [cepMask])),
              ],
            ),
            TextField(
                decoration: const InputDecoration(labelText: 'Bairro'),
                controller: bairroCtrl),
            const SizedBox(height: 8),
            DropdownButtonFormField<int?>(
              decoration: const InputDecoration(labelText: 'Imobiliária'),
              value: imobiliariaId,
              items: [
                const DropdownMenuItem(
                    value: null, child: Text('Sem imobiliária')),
                ...imobs.map((Imobiliaria i) =>
                    DropdownMenuItem(value: i.id, child: Text(i.nome))),
              ],
              onChanged: (v) => setState(() => imobiliariaId = v),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: saving
                  ? null
                  : () async {
                      if (!_formKey.currentState!.validate()) return;

                      final m = (_loaded ?? Casa())
                        ..descricao = descricaoCtrl.text.trim()
                        ..rua = ruaCtrl.text.trim().isEmpty
                            ? null
                            : ruaCtrl.text.trim()
                        ..numero = numeroCtrl.text.trim().isEmpty
                            ? null
                            : numeroCtrl.text.trim()
                        ..cep = cepCtrl.text.trim().isEmpty
                            ? null
                            : cepMask.getUnmaskedText()
                        ..bairro = bairroCtrl.text.trim().isEmpty
                            ? null
                            : bairroCtrl.text.trim()
                        ..imobiliariaId = imobiliariaId;

                      // Salva localmente primeiro
                      try {
                        await ref.read(casaActionsProvider.notifier).save(m);
                      } catch (e) {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Erro ao salvar localmente: $e')),
                          );
                        }
                        return;
                      }

                      // Depois tenta salvar na API (se falhar, não tem problema)
                      try {
                        final casaMap = {
                          'descricao': m.descricao,
                          'rua': m.rua,
                          'numero': m.numero,
                          'cep': m.cep,
                          'bairro': m.bairro,
                          'imobiliariaId': m.imobiliariaId,
                        };
                        await salvarCasa(casaMap);
                      } catch (e) {
                        print('Falha ao salvar na API: $e');
                      }

                      if (mounted) Navigator.pop(context);
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
