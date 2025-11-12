// src/core/utils/id.dart
// Helpers simples de datas e IDs.

import 'package:intl/intl.dart';

String formatDateTime(DateTime dt) => DateFormat('dd/MM/yyyy HH:mm').format(dt);
String formatDate(DateTime dt) => DateFormat('dd/MM/yyyy').format(dt);
String formatMoney(num v) => NumberFormat.simpleCurrency(locale: 'pt_BR').format(v);
