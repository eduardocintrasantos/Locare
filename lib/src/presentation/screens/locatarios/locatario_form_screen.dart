// Form de Locatário: nome* + dados e fiador. "Alterado em" quando aplicável.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/locatario.dart';
import '../../../core/formz_inputs/non_empty_input.dart';
import '../../../core/utils/id.dart';
import '../../providers/locatario_providers.dart';
import '../../../domain/repositories/locatario_repo.dart';
import '../../providers/_repos_provider.dart';

class LocatarioFormScreen extends ConsumerStatefulWidget {
  final int? id;
  const LocatarioFormScreen({super.key, this.id});

  @override
  ConsumerState<LocatarioFormScreen> createState() => _LocatarioFormScreenState();
}

class _LocatarioFormScreenState extends ConsumerState<LocatarioFormScreen> {
  final _formKey = GlobalKey<FormState>();
  var nome = const NonEmptyInput.pure();
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

  Future<void> _loadIfNeeded() async {
    if (widget.id == null) return;
    final repo = ref.read(locatarioRepoProvider);
    final m = await repo.getById(widget.id!);
    if (!mounted) return;
    setState(() {
      _loaded = m;
      if (m != null) {
        nome = NonEmptyInput.dirty(m.nome);
        cpfCtrl.text = m.cpf ?? '';
        rgCtrl.text = m.rg ?? '';
        telCtrl.text = m.telefone ?? '';
        celCtrl.text = m.celular ?? '';
        fNomeCtrl.text = m.fiadorNome ?? '';
        fCpfCtrl.text = m.fiadorCpf ?? '';
        fRgCtrl.text = m.fiadorRg ?? '';
        fTelCtrl.text = m.fiadorTelefone ?? '';
        fCelCtrl.text = m.fiadorCelular ?? '';
      }
    });
  }

  bool get isValid => nome.valid;

  @override
  Widget build(BuildContext context) {
    final saving = ref.watch(locatarioActionsProvider).isLoading;

    return Scaffold(
      appBar: AppBar(title: Text(widget.id == null ? 'Novo Locatário' : 'Editar Locatário')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (_loaded?.updatedAt != null)
              Text('Alterado em ${formatDateTime(_loaded!.updatedAt!)}', style: const TextStyle(color: Colors.red)),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome *'),
              initialValue: nome.value,
              onChanged: (v) => setState(() => nome = NonEmptyInput.dirty(v)),
              validator: (_) => nome.invalid ? 'Obrigatório' : null,
            ),
            Row(
              children: [
                Expanded(child: TextField(decoration: const InputDecoration(labelText: 'CPF'), controller: cpfCtrl)),
                const SizedBox(width: 8),
                Expanded(child: TextField(decoration: const InputDecoration(labelText: 'RG'), controller: rgCtrl)),
              ],
            ),
            Row(
              children: [
                Expanded(child: TextField(decoration: const InputDecoration(labelText: 'Telefone'), controller: telCtrl)),
                const SizedBox(width: 8),
                Expanded(child: TextField(decoration: const InputDecoration(labelText: 'Celular'), controller: celCtrl)),
              ],
            ),
            const Divider(height: 24),
            const Text('Fiador', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(decoration: const InputDecoration(labelText: 'Nome'), controller: fNomeCtrl),
            Row(
              children: [
                Expanded(child: TextField(decoration: const InputDecoration(labelText: 'CPF'), controller: fCpfCtrl)),
                const SizedBox(width: 8),
                Expanded(child: TextField(decoration: const InputDecoration(labelText: 'RG'), controller: fRgCtrl)),
              ],
            ),
            Row(
              children: [
                Expanded(child: TextField(decoration: const InputDecoration(labelText: 'Telefone'), controller: fTelCtrl)),
                const SizedBox(width: 8),
                Expanded(child: TextField(decoration: const InputDecoration(labelText: 'Celular'), controller: fCelCtrl)),
              ],
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: saving ? null : () async {
                if (!_formKey.currentState!.validate()) return;
                final m = (_loaded ?? Locatario()..id = widget.id ?? 0)
                  ..nome = nome.value.trim()
                  ..cpf = cpfCtrl.text.trim().isEmpty ? null : cpfCtrl.text.trim()
                  ..rg = rgCtrl.text.trim().isEmpty ? null : rgCtrl.text.trim()
                  ..telefone = telCtrl.text.trim().isEmpty ? null : telCtrl.text.trim()
                  ..celular = celCtrl.text.trim().isEmpty ? null : celCtrl.text.trim()
                  ..fiadorNome = fNomeCtrl.text.trim().isEmpty ? null : fNomeCtrl.text.trim()
                  ..fiadorCpf = fCpfCtrl.text.trim().isEmpty ? null : fCpfCtrl.text.trim()
                  ..fiadorRg = fRgCtrl.text.trim().isEmpty ? null : fRgCtrl.text.trim()
                  ..fiadorTelefone = fTelCtrl.text.trim().isEmpty ? null : fTelCtrl.text.trim()
                  ..fiadorCelular = fCelCtrl.text.trim().isEmpty ? null : fCelCtrl.text.trim();
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
