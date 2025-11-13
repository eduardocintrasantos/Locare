// src/presentation/widgets/confirm_dialog.dart
// Dialog genérico de confirmação (OK/Cancelar).

import 'package:flutter/material.dart';

Future<bool> confirmDialog(
  BuildContext context, {
  required String title,
  required String message,
  String cancelText = 'Cancelar',
  String okText = 'Confirmar',
}) async {
  final r = await showDialog<bool>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: Text(cancelText)),
        FilledButton(onPressed: () => Navigator.pop(dialogContext, true), child: Text(okText)),
      ],
    ),
  );
  return r ?? false;
}
