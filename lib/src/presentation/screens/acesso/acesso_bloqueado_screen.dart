// src/presentation/screens/acesso/acesso_bloqueado_screen.dart
// Tela exibida quando o trial expira e o usuário não tem plano ativo.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/cadastro_provider.dart';
import '../../../core/auth/auth_service.dart';
import '../../providers/vinculo_providers.dart';
import '../../providers/resumo_financeiro_providers.dart';
import '../../providers/auth_provider.dart';

class AcessoBloqueadoScreen extends ConsumerWidget {
  const AcessoBloqueadoScreen({super.key});

  Future<void> _handleLogout(BuildContext context, WidgetRef ref) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sair'),
        content: const Text('Deseja realmente sair do sistema?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Sair'),
          ),
        ],
      ),
    );

    if (confirm == true && context.mounted) {
      final authService = AuthService();
      await authService.logout();

      ref.read(dataRefreshProvider.notifier).state++;

      // Resetar filtros
      ref.read(vinculoFiltroCasaProvider.notifier).state = null;
      ref.read(vinculoFiltroImobProvider.notifier).state = null;
      ref.read(vinculoFiltroLocProvider.notifier).state = null;
      ref.read(vinculoApenasAtivosProvider.notifier).state = false;

      final now = DateTime.now();
      ref.read(resumoFiltroProvider.notifier).state =
          ResumoFiltro(ano: now.year, mes: now.month);

      if (context.mounted) {
        context.go('/login');
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usuarioAsync = ref.watch(usuarioAtualProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // Ícone de bloqueio
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.lock_clock,
                  size: 80,
                  color: Colors.orange.shade700,
                ),
              ),

              const SizedBox(height: 32),

              // Título
              Text(
                'Período de Teste Expirado',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              // Descrição
              Text(
                'Seu período de teste gratuito de 7 dias chegou ao fim. '
                'Para continuar usando o Locare e gerenciando seus imóveis, '
                'assine um de nossos planos.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              // Botão de assinar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    context.push('/assinatura');
                  },
                  icon: const Icon(Icons.star),
                  label: const Text('Ver Planos e Assinar'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Info do usuário
              usuarioAsync.when(
                data: (usuario) {
                  if (usuario == null) return const SizedBox.shrink();
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: Text(
                              usuario.nome.isNotEmpty
                                  ? usuario.nome[0].toUpperCase()
                                  : '?',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  usuario.nome,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  usuario.email,
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),

              const Spacer(),

              // Botões inferiores
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () => _handleLogout(context, ref),
                    icon: const Icon(Icons.logout),
                    label: const Text('Sair'),
                  ),
                  const SizedBox(width: 16),
                  TextButton.icon(
                    onPressed: () {
                      context.push('/conta');
                    },
                    icon: const Icon(Icons.person),
                    label: const Text('Minha Conta'),
                  ),
                ],
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
