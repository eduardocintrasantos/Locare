// src/core/formz_inputs/cnpj_input.dart
// Validação simples de CNPJ (tamanho). Sem cálculo dos DV.

import 'package:formz/formz.dart';

enum CnpjError { invalid }

class CnpjInput extends FormzInput<String, CnpjError> {
  const CnpjInput.pure() : super.pure('');
  const CnpjInput.dirty([String value = '']) : super.dirty(value);

  @override
  CnpjError? validator(String value) {
    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length != 14) return CnpjError.invalid;
    return null;
  }
}
