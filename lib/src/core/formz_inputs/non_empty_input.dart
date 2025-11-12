// src/core/formz_inputs/non_empty_input.dart
// Valida campo obrigatório (não vazio).

import 'package:formz/formz.dart';

enum NonEmptyError { empty }

class NonEmptyInput extends FormzInput<String, NonEmptyError> {
  const NonEmptyInput.pure() : super.pure('');
  const NonEmptyInput.dirty([String value = '']) : super.dirty(value);

  @override
  NonEmptyError? validator(String value) {
    return value.trim().isEmpty ? NonEmptyError.empty : null;
  }
}
