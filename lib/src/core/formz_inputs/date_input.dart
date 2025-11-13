// src/core/formz_inputs/date_input.dart
// Representa uma data no formato dd/MM/yyyy.

import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

enum DateError { invalid }

class DateInput extends FormzInput<String, DateError> {
  const DateInput.pure() : super.pure('');
  const DateInput.dirty([String value = '']) : super.dirty(value);

  DateTime? get asDate {
    try {
      return DateFormat('dd/MM/yyyy').parseStrict(value);
    } catch (_) {
      return null;
    }
  }

  @override
  DateError? validator(String value) {
    try {
      DateFormat('dd/MM/yyyy').parseStrict(value);
      return null;
    } catch (_) {
      return DateError.invalid;
    }
  }

  bool get valid => validator(value) == null;
  bool get invalid => !valid;
}
