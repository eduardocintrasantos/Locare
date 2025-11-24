// Form de Locatário: nome* + dados e fiador. "Alterado em" quando aplicável.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../domain/entities/locatario.dart';
import '../../../core/formz_inputs/non_empty_input.dart';
import '../../../core/utils/id.dart';
import '../../providers/locatario_providers.dart';
import '../../providers/_repos_provider.dart';
import '../../../data/api/post/locatario.dart';

class LocatarioFormScreen extends ConsumerStatefulWidget {
  final int? id;
  const LocatarioFormScreen({super.key, this.id});

  @override
  ConsumerState<LocatarioFormScreen> createState() =>
      _LocatarioFormScreenState();
}

class _LocatarioFormScreenState extends ConsumerState<LocatarioFormScreen> {
  final _formKey = GlobalKey<FormState>();
  var nome = const NonEmptyInput.pure();
  final nomeCtrl = TextEditingController();
  final cpfCtrl = TextEditingController();
  final rgCtrl = TextEditingController();
  final telCtrl = TextEditingController();
  final celCtrl = TextEditingController();
  final fNomeCtrl = TextEditingController();
  final fCpfCtrl = TextEditingController();
  final fRgCtrl = TextEditingController();
  final fTelCtrl = TextEditingController();
  final fCelCtrl = TextEditingController();
  Locatario? _loaded;
  bool _isSaving = false;

  // Máscaras
  final cpfMask = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final rgMask = MaskTextInputFormatter(
    mask: '##.###.###-#',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final telMask = MaskTextInputFormatter(
    mask: '(16) ####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final celMask = MaskTextInputFormatter(
    mask: '(16) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  // Máscaras para fiador
  final fCpfMask = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final fRgMask = MaskTextInputFormatter(
    mask: '##.###.###-#',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final fTelMask = MaskTextInputFormatter(
    mask: '(16) ####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final fCelMask = MaskTextInputFormatter(
    mask: '(16) #####-####',
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
    cpfCtrl.dispose();
    rgCtrl.dispose();
    telCtrl.dispose();
    celCtrl.dispose();
    fNomeCtrl.dispose();
    fCpfCtrl.dispose();
    fRgCtrl.dispose();
    fTelCtrl.dispose();
    fCelCtrl.dispose();
    super.dispose();
  }

  Future<void> _loadIfNeeded() async {
    if (widget.id == null) return;
    final repo = ref.read(locatarioRepoProvider);
    final m = await repo.getById(widget.id!);
    if (!mounted) return;

    if (m != null) {
      nomeCtrl.text = m.nome;
      nome = NonEmptyInput.dirty(m.nome);

      if (m.cpf != null && m.cpf!.isNotEmpty) {
        cpfCtrl.text = cpfMask.maskText(m.cpf!);
      }
      if (m.rg != null && m.rg!.isNotEmpty) {
        rgCtrl.text = rgMask.maskText(m.rg!);
      }
      if (m.telefone != null && m.telefone!.isNotEmpty) {
        telCtrl.text = telMask.maskText(m.telefone!);
      }
      if (m.celular != null && m.celular!.isNotEmpty) {
        celCtrl.text = celMask.maskText(m.celular!);
      }

      fNomeCtrl.text = m.fiadorNome ?? '';

      if (m.fiadorCpf != null && m.fiadorCpf!.isNotEmpty) {
        fCpfCtrl.text = fCpfMask.maskText(m.fiadorCpf!);
      }
      if (m.fiadorRg != null && m.fiadorRg!.isNotEmpty) {
        fRgCtrl.text = fRgMask.maskText(m.fiadorRg!);
      }
      if (m.fiadorTelefone != null && m.fiadorTelefone!.isNotEmpty) {
        fTelCtrl.text = fTelMask.maskText(m.fiadorTelefone!);
      }
      if (m.fiadorCelular != null && m.fiadorCelular!.isNotEmpty) {
        fCelCtrl.text = fCelMask.maskText(m.fiadorCelular!);
      }
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
          title:
              Text(widget.id == null ? 'Novo Locatário' : 'Editar Locatário')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (_loaded?.updatedAt != null)
              Text('Alterado em ${formatDateTime(_loaded!.updatedAt!)}',
                  style: const TextStyle(color: Colors.red)),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome *'),
              controller: nomeCtrl,
              onChanged: (v) => setState(() => nome = NonEmptyInput.dirty(v)),
              validator: (_) => nome.invalid ? 'Obrigatório' : null,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                        labelText: 'CPF', hintText: '000.000.000-00'),
                    controller: cpfCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [cpfMask],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                        labelText: 'RG', hintText: '00.000.000-0'),
                    controller: rgCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [rgMask],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                        decoration: const InputDecoration(
                            labelText: 'Telefone', hintText: '(16) 0000-0000'),
                        controller: telCtrl,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [telMask])),
                const SizedBox(width: 8),
                Expanded(
                    child: TextField(
                        decoration: const InputDecoration(
                            labelText: 'Celular', hintText: '(16) 00000-0000'),
                        controller: celCtrl,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [celMask])),
              ],
            ),
            const Divider(height: 24),
            const Text('Fiador', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
                decoration: const InputDecoration(labelText: 'Nome'),
                controller: fNomeCtrl),
            Row(
              children: [
                Expanded(
                    child: TextField(
                        decoration: const InputDecoration(
                            labelText: 'CPF', hintText: '000.000.000-00'),
                        controller: fCpfCtrl,
                        keyboardType: TextInputType.number,
                        inputFormatters: [fCpfMask])),
                const SizedBox(width: 8),
                Expanded(
                    child: TextField(
                        decoration: const InputDecoration(
                            labelText: 'RG', hintText: '00.000.000-0'),
                        controller: fRgCtrl,
                        keyboardType: TextInputType.number,
                        inputFormatters: [fRgMask])),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                        decoration: const InputDecoration(
                            labelText: 'Telefone', hintText: '(16) 0000-0000'),
                        controller: fTelCtrl,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [fTelMask])),
                const SizedBox(width: 8),
                Expanded(
                    child: TextField(
                        decoration: const InputDecoration(
                            labelText: 'Celular', hintText: '(16) 00000-0000'),
                        controller: fCelCtrl,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [fCelMask])),
              ],
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _isSaving
                  ? null
                  : () async {
                      if (!_formKey.currentState!.validate()) return;

                      setState(() => _isSaving = true);

                      final m = (_loaded ?? Locatario())
                        ..nome = nomeCtrl.text.trim()
                        ..cpf = cpfCtrl.text.trim().isEmpty
                            ? null
                            : cpfMask.getUnmaskedText()
                        ..rg = rgCtrl.text.trim().isEmpty
                            ? null
                            : rgMask.getUnmaskedText()
                        ..telefone = telCtrl.text.trim().isEmpty
                            ? null
                            : telMask.getUnmaskedText()
                        ..celular = celCtrl.text.trim().isEmpty
                            ? null
                            : celMask.getUnmaskedText()
                        ..fiadorNome = fNomeCtrl.text.trim().isEmpty
                            ? null
                            : fNomeCtrl.text.trim()
                        ..fiadorCpf = fCpfCtrl.text.trim().isEmpty
                            ? null
                            : fCpfMask.getUnmaskedText()
                        ..fiadorRg = fRgCtrl.text.trim().isEmpty
                            ? null
                            : fRgMask.getUnmaskedText()
                        ..fiadorTelefone = fTelCtrl.text.trim().isEmpty
                            ? null
                            : fTelMask.getUnmaskedText()
                        ..fiadorCelular = fCelCtrl.text.trim().isEmpty
                            ? null
                            : fCelMask.getUnmaskedText();

                      // Salva localmente primeiro
                      try {
                        await ref
                            .read(locatarioActionsProvider.notifier)
                            .save(m);

                        // Depois tenta salvar na API (se falhar, não tem problema)
                        try {
                          final locatarioMap = {
                            'id': m.id,
                            'nome': m.nome,
                            'cpf': m.cpf,
                            'rg': m.rg,
                            'telefone': m.telefone,
                            'celular': m.celular,
                            'fiadorNome': m.fiadorNome,
                            'fiadorCpf': m.fiadorCpf,
                            'fiadorRg': m.fiadorRg,
                            'fiadorTelefone': m.fiadorTelefone,
                            'fiadorCelular': m.fiadorCelular,
                          };
                          await salvarLocatario(locatarioMap);
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
