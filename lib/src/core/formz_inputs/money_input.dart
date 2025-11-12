// src/core/formz_inputs/money_input.dart
// Valida valor monetário não-negativo.

import 'package:formz/formz.dart';

enum MoneyError { invalid }

class MoneyInput extends FormzInput<String, MoneyError> {
  const MoneyInput.pure() : super.pure('');
  const MoneyInput.dirty([String value = '']) : super.dirty(value);

  num get asNum {
    final v = value.replaceAll(RegExp(r'[^0-9,.-]'), '').replaceAll('.', '').replaceAll(',', '.');
    return num.tryParse(v) ?? 0;
  }

  @override
  MoneyError? validator(String value) {
    final v = value.replaceAll(RegExp(r'[^0-9,.-]'), '').replaceAll('.', '').replaceAll(',', '.');
    final parsed = num.tryParse(v);
    if (parsed == null || parsed < 0) return MoneyError.invalid;
    return null;
  }
}
