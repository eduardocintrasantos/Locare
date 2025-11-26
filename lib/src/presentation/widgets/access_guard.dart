// src/presentation/widgets/access_guard.dart
// Widget que verifica se o usuário tem acesso (trial ou premium).
// Redireciona para tela de bloqueio se não tiver.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/cadastro_provider.dart';

class AccessGuard extends ConsumerWidget {
  final Widget child;

  const AccessGuard({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final temAcessoAsync = ref.watch(temAcessoProvider);

    return temAcessoAsync.when(
      data: (temAcesso) {
        if (!temAcesso) {
          // Usar WidgetsBinding para evitar navegação durante build
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              context.go('/acesso-bloqueado');
            }
          });
          // Mostrar loading enquanto redireciona
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return child;
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) {
        // Em caso de erro, permite acesso (fail-open) mas loga o erro
        debugPrint('Erro ao verificar acesso: $error');
        return child;
      },
    );
  }
}
