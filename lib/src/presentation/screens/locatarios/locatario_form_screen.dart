// Form de Locatário: nome* + dados e fiador. "Alterado em" quando aplicável.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/locatario.dart';
import '../../../core/formz_inputs/non_empty_input.dart';
import '../../../core/utils/id.dart';
import '../../providers/locatario_providers.dart';
import '../../providers/_repos_provider.dart';

// Funções auxiliares para máscaras
String _formatCpf(String value) {
  value = value.replaceAll(RegExp(r'\D'), '');
  if (value.length > 11) value = value.substring(0, 11);
  if (value.isEmpty) return '';
  if (value.length <= 3) return value;
  if (value.length <= 6)
    return '${value.substring(0, 3)}.${value.substring(3)}';
  if (value.length <= 9)
    return '${value.substring(0, 3)}.${value.substring(3, 6)}.${value.substring(6)}';
  return '${value.substring(0, 3)}.${value.substring(3, 6)}.${value.substring(6, 9)}-${value.substring(9)}';
}

String _formatRg(String value) {
  value = value.replaceAll(RegExp(r'\D'), '');
  if (value.length > 9) value = value.substring(0, 9);
  if (value.isEmpty) return '';
  if (value.length <= 2) return value;
  if (value.length <= 5)
    return '${value.substring(0, 2)}.${value.substring(2)}';
  if (value.length <= 8)
    return '${value.substring(0, 2)}.${value.substring(2, 5)}.${value.substring(5)}';
  return '${value.substring(0, 2)}.${value.substring(2, 5)}.${value.substring(5, 8)}-${value.substring(8)}';
}

String _formatPhone(String value) {
  value = value.replaceAll(RegExp(r'\D'), '');
  if (value.length > 10) value = value.substring(0, 10);
  if (value.isEmpty) return '';
  if (value.length <= 2) return '($value';
  if (value.length <= 6)
    return '(${value.substring(0, 2)}) ${value.substring(2)}';
  return '(${value.substring(0, 2)}) ${value.substring(2, 6)}-${value.substring(6)}';
}

String _formatCellPhone(String value) {
  value = value.replaceAll(RegExp(r'\D'), '');
  if (value.length > 11) value = value.substring(0, 11);
  if (value.isEmpty) return '';
  if (value.length <= 2) return '($value';
  if (value.length <= 7)
    return '(${value.substring(0, 2)}) ${value.substring(2)}';
  return '(${value.substring(0, 2)}) ${value.substring(2, 7)}-${value.substring(7)}';
}

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
      cpfCtrl.text = _formatCpf(m.cpf ?? '');
      rgCtrl.text = _formatRg(m.rg ?? '');
      telCtrl.text = _formatPhone(m.telefone ?? '');
      celCtrl.text = _formatCellPhone(m.celular ?? '');
      fNomeCtrl.text = m.fiadorNome ?? '';
      fCpfCtrl.text = _formatCpf(m.fiadorCpf ?? '');
      fRgCtrl.text = _formatRg(m.fiadorRg ?? '');
      fTelCtrl.text = _formatPhone(m.fiadorTelefone ?? '');
      fCelCtrl.text = _formatCellPhone(m.fiadorCelular ?? '');
    }

    setState(() {
      _loaded = m;
    });
  }

  bool get isValid => nome.valid;

  @override
  Widget build(BuildContext context) {
    final saving = ref.watch(locatarioActionsProvider).isLoading;

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
                    decoration: const InputDecoration(labelText: 'CPF'),
                    controller: cpfCtrl,
                    onChanged: (v) {
                      final formatted = _formatCpf(v);
                      if (formatted != v) {
                        cpfCtrl.value = cpfCtrl.value.copyWith(
                          text: formatted,
                          selection: TextSelection.fromPosition(
                              TextPosition(offset: formatted.length)),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'RG'),
                    controller: rgCtrl,
                    onChanged: (v) {
                      final formatted = _formatRg(v);
                      if (formatted != v) {
                        rgCtrl.value = rgCtrl.value.copyWith(
                          text: formatted,
                          selection: TextSelection.fromPosition(
                              TextPosition(offset: formatted.length)),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                        decoration:
                            const InputDecoration(labelText: 'Telefone'),
                        controller: telCtrl,
                        onChanged: (v) {
                          final formatted = _formatPhone(v);
                          if (formatted != v) {
                            telCtrl.value = telCtrl.value.copyWith(
                              text: formatted,
                              selection: TextSelection.fromPosition(
                                  TextPosition(offset: formatted.length)),
                            );
                          }
                        })),
                const SizedBox(width: 8),
                Expanded(
                    child: TextField(
                        decoration: const InputDecoration(labelText: 'Celular'),
                        controller: celCtrl,
                        onChanged: (v) {
                          final formatted = _formatCellPhone(v);
                          if (formatted != v) {
                            celCtrl.value = celCtrl.value.copyWith(
                              text: formatted,
                              selection: TextSelection.fromPosition(
                                  TextPosition(offset: formatted.length)),
                            );
                          }
                        })),
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
                        decoration: const InputDecoration(labelText: 'CPF'),
                        controller: fCpfCtrl,
                        onChanged: (v) {
                          final formatted = _formatCpf(v);
                          if (formatted != v) {
                            fCpfCtrl.value = fCpfCtrl.value.copyWith(
                              text: formatted,
                              selection: TextSelection.fromPosition(
                                  TextPosition(offset: formatted.length)),
                            );
                          }
                        })),
                const SizedBox(width: 8),
                Expanded(
                    child: TextField(
                        decoration: const InputDecoration(labelText: 'RG'),
                        controller: fRgCtrl,
                        onChanged: (v) {
                          final formatted = _formatRg(v);
                          if (formatted != v) {
                            fRgCtrl.value = fRgCtrl.value.copyWith(
                              text: formatted,
                              selection: TextSelection.fromPosition(
                                  TextPosition(offset: formatted.length)),
                            );
                          }
                        })),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                        decoration:
                            const InputDecoration(labelText: 'Telefone'),
                        controller: fTelCtrl,
                        onChanged: (v) {
                          final formatted = _formatPhone(v);
                          if (formatted != v) {
                            fTelCtrl.value = fTelCtrl.value.copyWith(
                              text: formatted,
                              selection: TextSelection.fromPosition(
                                  TextPosition(offset: formatted.length)),
                            );
                          }
                        })),
                const SizedBox(width: 8),
                Expanded(
                    child: TextField(
                        decoration: const InputDecoration(labelText: 'Celular'),
                        controller: fCelCtrl,
                        onChanged: (v) {
                          final formatted = _formatCellPhone(v);
                          if (formatted != v) {
                            fCelCtrl.value = fCelCtrl.value.copyWith(
                              text: formatted,
                              selection: TextSelection.fromPosition(
                                  TextPosition(offset: formatted.length)),
                            );
                          }
                        })),
              ],
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: saving
                  ? null
                  : () async {
                      if (!_formKey.currentState!.validate()) return;
                      final m = (_loaded ?? Locatario())
                        ..nome = nomeCtrl.text.trim()
                        ..cpf = cpfCtrl.text.trim().isEmpty
                            ? null
                            : cpfCtrl.text.replaceAll(RegExp(r'\D'), '').trim()
                        ..rg = rgCtrl.text.trim().isEmpty
                            ? null
                            : rgCtrl.text.replaceAll(RegExp(r'\D'), '').trim()
                        ..telefone = telCtrl.text.trim().isEmpty
                            ? null
                            : telCtrl.text.replaceAll(RegExp(r'\D'), '').trim()
                        ..celular = celCtrl.text.trim().isEmpty
                            ? null
                            : celCtrl.text.replaceAll(RegExp(r'\D'), '').trim()
                        ..fiadorNome = fNomeCtrl.text.trim().isEmpty
                            ? null
                            : fNomeCtrl.text.trim()
                        ..fiadorCpf = fCpfCtrl.text.trim().isEmpty
                            ? null
                            : fCpfCtrl.text.replaceAll(RegExp(r'\D'), '').trim()
                        ..fiadorRg = fRgCtrl.text.trim().isEmpty
                            ? null
                            : fRgCtrl.text.replaceAll(RegExp(r'\D'), '').trim()
                        ..fiadorTelefone = fTelCtrl.text.trim().isEmpty
                            ? null
                            : fTelCtrl.text.replaceAll(RegExp(r'\D'), '').trim()
                        ..fiadorCelular = fCelCtrl.text.trim().isEmpty
                            ? null
                            : fCelCtrl.text
                                .replaceAll(RegExp(r'\D'), '')
                                .trim();
                      await ref.read(locatarioActionsProvider.notifier).save(m);
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
