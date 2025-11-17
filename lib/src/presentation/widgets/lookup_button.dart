// src/presentation/widgets/lookup_button.dart
// Botão de “lupa” que abre um Dialog com conteúdo de leitura.

import 'package:flutter/material.dart';

class LookupButton extends StatelessWidget {
  final String tooltip;
  final Widget dialogContent;
  const LookupButton(
      {super.key, required this.tooltip, required this.dialogContent});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      icon: const Icon(Icons.search),
      onPressed: () {
        showDialog(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: Text(tooltip),
            content: dialogContent,
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('Fechar'),
              ),
            ],
          ),
        );
      },
    );
  }
}
