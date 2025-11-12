// src/core/formz_inputs/percent_input.dart
// Valida percentual entre 0 e 100.

import 'package:formz/formz.dart';

enum PercentError { invalid }

class PercentInput extends FormzInput<String, PercentError> {
  const PercentInput.pure() : super.pure('');
  const PercentInput.dirty([String value = '']) : super.dirty(value);

  num get asNum {
    final v = value.replaceAll('%', '').replaceAll(',', '.').trim();
    return num.tryParse(v) ?? 0;
    }

  @override
  PercentError? validator(String value) {
    final v = value.replaceAll('%', '').replaceAll(',', '.').trim();
    final parsed = num.tryParse(v);
    if (parsed == null || parsed < 0 || parsed > 100) return PercentError.invalid;
    return null;
  }
}
