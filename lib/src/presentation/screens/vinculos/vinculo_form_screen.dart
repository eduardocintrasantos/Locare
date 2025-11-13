// Form de Vínculo com cálculo automático taxa% <-> taxaR$, vigência e somente leitura se finalizado.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../domain/entities/vinculo.dart';
import '../../../domain/entities/casa.dart';
import '../../../domain/entities/imobiliaria.dart';
import '../../../domain/entities/locatario.dart';
import '../../../presentation/providers/casa_providers.dart';
import '../../../presentation/providers/imobiliaria_providers.dart';
import '../../../presentation/providers/locatario_providers.dart';
import '../../../presentation/providers/vinculo_providers.dart';
import '../../../presentation/widgets/lookup_button.dart';
import '../../../presentation/widgets/confirm_dialog.dart';
import '../../../core/formz_inputs/date_input.dart';
import '../../../core/formz_inputs/money_input.dart';
import '../../../core/formz_inputs/percent_input.dart';
import '../../../core/utils/id.dart';
import '../../providers/_repos_provider.dart';

class VinculoFormScreen extends ConsumerStatefulWidget {
  final int? id;
  const VinculoFormScreen({super.key, this.id});

  @override
  ConsumerState<VinculoFormScreen> createState() => _VinculoFormScreenState();
}

class _VinculoFormScreenState extends ConsumerState<VinculoFormScreen> {
  final _formKey = GlobalKey<FormState>();

  int? casaId;
  int? imobiliariaId;
  int? locatarioId;

  var valorAluguel = const MoneyInput.pure();
  var taxaPercent  = const PercentInput.pure();
  var taxaValor    = const MoneyInput.pure();

  var inicio = const DateInput.pure();
  var fim    = const DateInput.pure();

  Vinculo? _loaded;

  @override
  void initState() {
    super.initState();
    _loadIfNeeded();
  }

  Future<void> _loadIfNeeded() async {
    if (widget.id == null) return;
    final repo = ref.read(vinculoRepoProvider);
    final v = await repo.getById(widget.id!);
    if (!mounted) return;
    setState(() {
      _loaded = v;
      if (v != null) {
        casaId = v.casaId;
        imobiliariaId = v.imobiliariaId;
        locatarioId = v.locatarioId;
        // Formata valores monetários sem símbolos (apenas número com vírgula/ponto)
        valorAluguel = MoneyInput.dirty((v.valorAluguel ?? 0).toStringAsFixed(2).replaceAll('.', ','));
        taxaPercent  = PercentInput.dirty((v.taxaPercent ?? 0).toStringAsFixed(2));
        taxaValor    = MoneyInput.dirty((v.taxaValor ?? 0).toStringAsFixed(2).replaceAll('.', ','));
        inicio = DateInput.dirty(DateFormat('dd/MM/yyyy').format(v.inicio));
        fim    = DateInput.dirty(v.fim == null ? '' : DateFormat('dd/MM/yyyy').format(v.fim!));
      }
    });
  }

  bool get _readOnly => _loaded?.fim != null;

  /// Formata automaticamente data: "01012025" vira "01/01/2025"
  String _formatDate(String input) {
    input = input.replaceAll(RegExp(r'[^0-9]'), ''); // remove tudo que não é número
    if (input.length > 8) input = input.substring(0, 8); // máximo 8 dígitos
    if (input.length >= 2) {
      input = input.replaceRange(2, 2, '/');
    }
    if (input.length >= 5) {
      input = input.replaceRange(5, 5, '/');
    }
    return input;
  }

  void _recalcularTaxas({bool preferValor = false}) {
    final alug = valorAluguel.asNum.toDouble();
    if (alug <= 0) return;
    if (preferValor) {
      final tv = taxaValor.asNum.toDouble();
      final tp = (tv / alug) * 100;
      setState(() => taxaPercent = PercentInput.dirty(tp.toStringAsFixed(2)));
    } else {
      final tp = taxaPercent.asNum.toDouble();
      final tv = alug * (tp / 100);
      setState(() => taxaValor = MoneyInput.dirty(NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(tv)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final casas = ref.watch(casasListProvider).value ?? [];
    final imobs = ref.watch(imobiliariasListProvider).value ?? [];
    final locs  = ref.watch(locatariosListProvider).value ?? [];
    final vinculos = ref.watch(vinculosListProvider).value ?? [];
    final saving = ref.watch(vinculoActionsProvider).isLoading;

    // IDs de casas e locatários com vínculos ATIVOS (fim = null)
    final casasComVinculoAtivo = <int>{};
    final locatariosComVinculoAtivo = <int>{};
    
    for (final v in vinculos) {
      if (v.fim == null) { // vínculo ativo
        casasComVinculoAtivo.add(v.casaId);
        locatariosComVinculoAtivo.add(v.locatarioId);
      }
    }

    // Filtra casas e locatários disponíveis (sem vínculo ativo)
    final casasDisponivel = casas.where((c) => !casasComVinculoAtivo.contains(c.id)).toList();
    final locsDisponivel = locs.where((l) => !locatariosComVinculoAtivo.contains(l.id)).toList();
    
    // Se estiver editando, sempre permite a casa e locatário atuais
    if (_loaded != null) {
      if (!casasDisponivel.any((c) => c.id == casaId)) {
        final casa = casas.firstWhere((c) => c.id == casaId, orElse: () => Casa()..id=0);
        if (casa.id != 0) casasDisponivel.add(casa);
      }
      if (!locsDisponivel.any((l) => l.id == locatarioId)) {
        final loc = locs.firstWhere((l) => l.id == locatarioId, orElse: () => Locatario()..id=0);
        if (loc.id != 0) locsDisponivel.add(loc);
      }
    }

    Widget _infoCasa() {
      final c = casas.firstWhere((e) => e.id == casaId, orElse: () => Casa()..descricao='-');
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(c.descricao, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text([c.rua, c.numero, c.bairro].where((e) => (e ?? '').isNotEmpty).join(', ')),
      ]);
    }

    Widget _infoImob() {
      final i = imobs.firstWhere((e) => e.id == imobiliariaId, orElse: () => Imobiliaria()..nome='-');
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(i.nome, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(i.cnpj ?? '-'),
      ]);
    }

    Widget _infoLoc() {
      final l = locs.firstWhere((e) => e.id == locatarioId, orElse: () => Locatario()..nome='-');
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(l.nome, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(l.telefone ?? '-'),
      ]);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id == null ? 'Novo Vínculo' : _readOnly ? 'Vínculo (somente leitura)' : 'Editar Vínculo'),
        actions: [
          if (_loaded != null && !_readOnly)
            TextButton.icon(
              onPressed: saving ? null : () async {
                final ok = await confirmDialog(context, title: 'Finalizar vínculo', message: 'Finalizar hoje?');
                if (!ok) return;
                await ref.read(vinculoActionsProvider.notifier).finalizar(_loaded!.id);
                if (mounted) Navigator.pop(context);
              },
              icon: const Icon(Icons.flag_outlined),
              label: const Text('Finalizar'),
            ),
        ],
      ),
      body: IgnorePointer(
        ignoring: _readOnly,
        child: Opacity(
          opacity: _readOnly ? 0.7 : 1,
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (_loaded?.updatedAt != null)
                  Text('Alterado em ${formatDateTime(_loaded!.updatedAt!)}', style: const TextStyle(color: Colors.red)),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<int>(
                        decoration: const InputDecoration(labelText: 'Casa *'),
                        value: casaId,
                        items: casasDisponivel.map((c) => DropdownMenuItem(value: c.id, child: Text(c.descricao))).toList(),
                        onChanged: (v) => setState(() => casaId = v),
                        validator: (v) => v == null ? 'Obrigatório' : null,
                      ),
                    ),
                    LookupButton(tooltip: 'Casa', dialogContent: _infoCasa()),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<int>(
                        decoration: const InputDecoration(labelText: 'Imobiliária *'),
                        value: imobiliariaId,
                        items: imobs.map((i) => DropdownMenuItem(value: i.id, child: Text(i.nome))).toList(),
                        onChanged: (v) => setState(() => imobiliariaId = v),
                        validator: (v) => v == null ? 'Obrigatório' : null,
                      ),
                    ),
                    LookupButton(tooltip: 'Imobiliária', dialogContent: _infoImob()),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<int>(
                        decoration: const InputDecoration(labelText: 'Locatário *'),
                        value: locatarioId,
                        items: locsDisponivel.map((l) => DropdownMenuItem(value: l.id, child: Text(l.nome))).toList(),
                        onChanged: (v) => setState(() => locatarioId = v),
                        validator: (v) => v == null ? 'Obrigatório' : null,
                      ),
                    ),
                    LookupButton(tooltip: 'Locatário', dialogContent: _infoLoc()),
                  ],
                ),
                const Divider(height: 24),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Valor do aluguel (R\$) *'),
                  initialValue: valorAluguel.value,
                  onChanged: (v) {
                    setState(() => valorAluguel = MoneyInput.dirty(v));
                    _recalcularTaxas(preferValor: false);
                  },
                  validator: (_) => valorAluguel.invalid ? 'Inválido' : null,
                  keyboardType: TextInputType.number,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'Taxa (%)'),
                        initialValue: taxaPercent.value,
                        onChanged: (v) {
                          setState(() => taxaPercent = PercentInput.dirty(v));
                          _recalcularTaxas(preferValor: false);
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'Taxa (R\$)'),
                        initialValue: taxaValor.value,
                        onChanged: (v) {
                          setState(() => taxaValor = MoneyInput.dirty(v));
                          _recalcularTaxas(preferValor: true);
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'Início (dd/MM/yyyy) *'),
                        initialValue: inicio.value,
                        onChanged: (v) {
                          final formatted = _formatDate(v);
                          setState(() => inicio = DateInput.dirty(formatted));
                        },
                        validator: (_) => inicio.invalid ? 'Data inválida' : null,
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'Fim (opcional)'),
                        initialValue: fim.value,
                        onChanged: (v) {
                          final formatted = _formatDate(v);
                          setState(() => fim = DateInput.dirty(formatted));
                        },
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: saving ? null : () async {
                    if (!_formKey.currentState!.validate()) return;
                    if (casaId == null || imobiliariaId == null || locatarioId == null) return;
                    try {
                      final v = (_loaded ?? Vinculo())
                        ..casaId = casaId!
                        ..imobiliariaId = imobiliariaId!
                        ..locatarioId = locatarioId!
                        ..valorAluguel = valorAluguel.asNum.toDouble()
                        ..taxaPercent = taxaPercent.asNum.toDouble()
                        ..taxaValor = taxaValor.asNum.toDouble()
                        ..inicio = inicio.asDate!
                        ..fim = (fim.value.trim().isEmpty) ? null : fim.asDate;

                      await ref.read(vinculoActionsProvider.notifier).save(v);
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
        ),
      ),
    );
  }
}
