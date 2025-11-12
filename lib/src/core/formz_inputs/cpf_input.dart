// src/core/formz_inputs/cpf_input.dart
// Validação simples de CPF (tamanho e dígitos); sem dígitos verificadores complexos.

import 'package:formz/formz.dart';

enum CpfError { invalid }

class CpfInput extends FormzInput<String, CpfError> {
  const CpfInput.pure() : super.pure('');
  const CpfInput.dirty([String value = '']) : super.dirty(value);

  @override
  CpfError? validator(String value) {
    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length != 11) return CpfError.invalid;
    return null;
  }
}
