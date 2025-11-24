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
import '../../../data/api/post/vinculo.dart';

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
  var taxaPercent = const PercentInput.pure();
  var taxaValor = const MoneyInput.pure();

  var inicio = const DateInput.pure();
  var fim = const DateInput.pure();

  // Controllers para os campos de texto
  final valorAluguelCtrl = TextEditingController();
  final taxaPercentCtrl = TextEditingController();
  final taxaValorCtrl = TextEditingController();
  final inicioCtrl = TextEditingController();
  final fimCtrl = TextEditingController();

  Vinculo? _loaded;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadIfNeeded();
  }

  @override
  void dispose() {
    valorAluguelCtrl.dispose();
    taxaPercentCtrl.dispose();
    taxaValorCtrl.dispose();
    inicioCtrl.dispose();
    fimCtrl.dispose();
    super.dispose();
  }

  Future<void> _loadIfNeeded() async {
    if (widget.id == null) return;
    final repo = ref.read(vinculoRepoProvider);
    final v = await repo.getById(widget.id!);
    if (!mounted) return;

    if (v != null) {
      // Preencher controllers ANTES do setState
      valorAluguelCtrl.text =
          (v.valorAluguel ?? 0).toStringAsFixed(2).replaceAll('.', ',');
      taxaPercentCtrl.text = (v.taxaPercent ?? 0).toStringAsFixed(2);
      taxaValorCtrl.text =
          (v.taxaValor ?? 0).toStringAsFixed(2).replaceAll('.', ',');
      inicioCtrl.text = DateFormat('dd/MM/yyyy').format(v.inicio);
      fimCtrl.text =
          v.fim == null ? '' : DateFormat('dd/MM/yyyy').format(v.fim!);

      // Atualizar states do Formz
      valorAluguel = MoneyInput.dirty(valorAluguelCtrl.text);
      taxaPercent = PercentInput.dirty(taxaPercentCtrl.text);
      taxaValor = MoneyInput.dirty(taxaValorCtrl.text);
      inicio = DateInput.dirty(inicioCtrl.text);
      fim = DateInput.dirty(fimCtrl.text);
    }

    setState(() {
      _loaded = v;
      if (v != null) {
        casaId = v.casaId;
        imobiliariaId = v.imobiliariaId;
        // O banco armazena 0 quando não há locatário; usar null no formulário
        locatarioId = (v.locatarioId == 0) ? null : v.locatarioId;
      }
    });
  }

  bool get _readOnly => _loaded?.fim != null;

  /// Formata automaticamente data: "01012025" vira "01/01/2025"
  String _formatDate(String input) {
    input =
        input.replaceAll(RegExp(r'[^0-9]'), ''); // remove tudo que não é número
    if (input.length > 8) input = input.substring(0, 8); // máximo 8 dígitos

    String formatted = '';
    for (int i = 0; i < input.length; i++) {
      if (i == 2 || i == 4) formatted += '/';
      formatted += input[i];
    }
    return formatted;
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
      setState(() => taxaValor = MoneyInput.dirty(
          NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(tv)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final casas = ref.watch(casasListProvider).value ?? [];
    final imobs = ref.watch(imobiliariasListProvider).value ?? [];
    final locs = ref.watch(locatariosListProvider).value ?? [];
    final vinculos = ref.watch(vinculosListProvider).value ?? [];

    // IDs de casas e locatários com vínculos ATIVOS (fim = null)
    final casasComVinculoAtivo = <int>{};
    final locatariosComVinculoAtivo = <int>{};

    for (final v in vinculos) {
      if (v.fim == null) {
        // vínculo ativo
        casasComVinculoAtivo.add(v.casaId);
        // ignora locatário placeholder (0)
        if (v.locatarioId != 0) locatariosComVinculoAtivo.add(v.locatarioId);
      }
    }

    // Filtra casas e locatários disponíveis (sem vínculo ativo)
    final casasDisponivel =
        casas.where((c) => !casasComVinculoAtivo.contains(c.id)).toList();
    final locsDisponivel =
        locs.where((l) => !locatariosComVinculoAtivo.contains(l.id)).toList();

    // Se estiver editando, sempre permite a casa e locatário atuais
    if (_loaded != null) {
      // Adiciona a casa atual se não estiver na lista
      if (casaId != null && !casasDisponivel.any((c) => c.id == casaId)) {
        final casa = casas.firstWhere((c) => c.id == casaId,
            orElse: () => Casa()..id = 0);
        if (casa.id != 0) casasDisponivel.add(casa);
      }
      // Adiciona o locatário atual se houver um e não estiver na lista
      if (locatarioId != null &&
          !locsDisponivel.any((l) => l.id == locatarioId)) {
        final loc = locs.firstWhere((l) => l.id == locatarioId,
            orElse: () => Locatario()..id = 0);
        if (loc.id != 0) locsDisponivel.add(loc);
      }
    }

    Widget _infoCasa() {
      final c = casas.firstWhere((e) => e.id == casaId,
          orElse: () => Casa()..descricao = '-');
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(c.descricao, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text([c.rua, c.numero, c.bairro]
            .where((e) => (e ?? '').isNotEmpty)
            .join(', ')),
      ]);
    }

    Widget _infoImob() {
      final i = imobs.firstWhere((e) => e.id == imobiliariaId,
          orElse: () => Imobiliaria()..nome = '-');
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(i.nome, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(i.cnpj ?? '-'),
      ]);
    }

    Widget _infoLoc() {
      final l = locs.firstWhere((e) => e.id == locatarioId,
          orElse: () => Locatario()..nome = '-');
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(l.nome, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(l.telefone ?? '-'),
      ]);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id == null
            ? 'Novo Vínculo'
            : _readOnly
                ? 'Vínculo (somente leitura)'
                : 'Editar Vínculo'),
        actions: [
          if (_loaded != null && !_readOnly)
            TextButton.icon(
              onPressed: _isSaving
                  ? null
                  : () async {
                      final ok = await confirmDialog(context,
                          title: 'Finalizar vínculo',
                          message: 'Finalizar hoje?');
                      if (!ok) return;
                      await ref
                          .read(vinculoActionsProvider.notifier)
                          .finalizar(_loaded!.id);
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
                  Text('Alterado em ${formatDateTime(_loaded!.updatedAt!)}',
                      style: const TextStyle(color: Colors.red)),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<int>(
                        decoration: const InputDecoration(labelText: 'Casa *'),
                        value: casaId,
                        items: casasDisponivel
                            .map((c) => DropdownMenuItem(
                                value: c.id, child: Text(c.descricao)))
                            .toList(),
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
                        decoration:
                            const InputDecoration(labelText: 'Imobiliária *'),
                        value: imobiliariaId,
                        items: imobs
                            .map((i) => DropdownMenuItem(
                                value: i.id, child: Text(i.nome)))
                            .toList(),
                        onChanged: (v) => setState(() => imobiliariaId = v),
                        validator: (v) => v == null ? 'Obrigatório' : null,
                      ),
                    ),
                    LookupButton(
                        tooltip: 'Imobiliária', dialogContent: _infoImob()),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<int?>(
                        decoration:
                            const InputDecoration(labelText: 'Locatário'),
                        value: locatarioId,
                        items: [
                          const DropdownMenuItem<int?>(
                              value: null, child: Text('Sem locatário')),
                          ...locsDisponivel
                              .map((l) => DropdownMenuItem<int?>(
                                  value: l.id, child: Text(l.nome)))
                              .toList(),
                        ],
                        onChanged: (v) => setState(() => locatarioId = v),
                      ),
                    ),
                    LookupButton(
                        tooltip: 'Locatário', dialogContent: _infoLoc()),
                  ],
                ),
                const Divider(height: 24),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Valor do aluguel (R\$) *'),
                  controller: valorAluguelCtrl,
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
                        decoration:
                            const InputDecoration(labelText: 'Taxa (%)'),
                        controller: taxaPercentCtrl,
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
                        decoration:
                            const InputDecoration(labelText: 'Taxa (R\$)'),
                        controller: taxaValorCtrl,
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
                        decoration: const InputDecoration(
                            labelText: 'Início (dd/MM/yyyy) *'),
                        controller: inicioCtrl,
                        onChanged: (v) {
                          final formatted = _formatDate(v);
                          if (formatted != v) {
                            inicioCtrl.value = inicioCtrl.value.copyWith(
                              text: formatted,
                              selection: TextSelection.fromPosition(
                                  TextPosition(offset: formatted.length)),
                            );
                          }
                          setState(() => inicio = DateInput.dirty(formatted));
                        },
                        validator: (_) =>
                            inicio.invalid ? 'Data inválida' : null,
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Fim (opcional)'),
                        controller: fimCtrl,
                        onChanged: (v) {
                          final formatted = _formatDate(v);
                          if (formatted != v) {
                            fimCtrl.value = fimCtrl.value.copyWith(
                              text: formatted,
                              selection: TextSelection.fromPosition(
                                  TextPosition(offset: formatted.length)),
                            );
                          }
                          setState(() => fim = DateInput.dirty(formatted));
                        },
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: _isSaving
                      ? null
                      : () async {
                          if (!_formKey.currentState!.validate()) return;
                          if (casaId == null || imobiliariaId == null) return;

                          setState(() => _isSaving = true);

                          final v = (_loaded ?? Vinculo())
                            ..casaId = casaId!
                            ..imobiliariaId = imobiliariaId!
                            ..locatarioId = locatarioId ?? 0
                            ..valorAluguel = valorAluguel.asNum.toDouble()
                            ..taxaPercent = taxaPercent.asNum.toDouble()
                            ..taxaValor = taxaValor.asNum.toDouble()
                            ..inicio = inicio.asDate!
                            ..fim =
                                (fim.value.trim().isEmpty) ? null : fim.asDate;

                          // Salva localmente primeiro
                          try {
                            await ref
                                .read(vinculoActionsProvider.notifier)
                                .save(v);

                            // Depois tenta salvar na API (se falhar, não tem problema)
                            try {
                              final vinculoMap = {
                                'id': v.id,
                                'casaId': v.casaId,
                                'imobiliariaId': v.imobiliariaId,
                                'locatarioId': v.locatarioId,
                                'valorAluguel': v.valorAluguel,
                                'taxaPercent': v.taxaPercent,
                                'taxaValor': v.taxaValor,
                                'inicio': v.inicio.toIso8601String(),
                                'fim': v.fim?.toIso8601String(),
                              };
                              await salvarVinculo(vinculoMap);
                            } catch (e) {
                              print('Falha ao salvar na API: $e');
                            }

                            if (mounted) Navigator.pop(context);
                          } catch (e) {
                            if (mounted) {
                              setState(() => _isSaving = false);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text('Erro ao salvar localmente: $e')),
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
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
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
        ),
      ),
    );
  }
}
