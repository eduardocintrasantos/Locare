// src/presentation/screens/conta/conta_screen.dart
// Tela de configurações da conta - mostra status do plano e permite cancelar

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/auth/auth_service.dart';
import '../../providers/cadastro_provider.dart';
import '../../providers/auth_provider.dart';
import '../../providers/vinculo_providers.dart';
import '../../providers/resumo_financeiro_providers.dart';
import '../../widgets/confirm_dialog.dart';

class ContaScreen extends ConsumerWidget {
  const ContaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usuarioAsync = ref.watch(usuarioAtualProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Minha Conta')),
      body: usuarioAsync.when(
        data: (usuario) {
          if (usuario == null) {
            return const Center(child: Text('Usuário não encontrado'));
          }

          final diasRestantes = usuario.trialDaysRemaining;
          final isTrialAtivo = usuario.isTrialActive;
          final isPremium = usuario.isPremium;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Card do usuário
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Text(
                              usuario.nome.isNotEmpty
                                  ? usuario.nome[0].toUpperCase()
                                  : '?',
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  usuario.nome,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  usuario.email,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Card do plano
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status do Plano',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 12),
                      if (isPremium) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star,
                                  color: Colors.green[700], size: 18),
                              const SizedBox(width: 4),
                              Text(
                                'Premium',
                                style: TextStyle(
                                  color: Colors.green[700],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (usuario.premiumExpiresAt != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            'Válido até: ${_formatDate(usuario.premiumExpiresAt!)}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ] else if (isTrialAtivo) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.access_time,
                                  color: Colors.blue[700], size: 18),
                              const SizedBox(width: 4),
                              Text(
                                'Período de Teste',
                                style: TextStyle(
                                  color: Colors.blue[700],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          diasRestantes == 1
                              ? 'Resta 1 dia de teste'
                              : 'Restam $diasRestantes dias de teste',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Expira em: ${_formatDate(usuario.trialEndsAt)}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ] else ...[
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.warning,
                                  color: Colors.red[700], size: 18),
                              const SizedBox(width: 4),
                              Text(
                                'Período de Teste Expirado',
                                style: TextStyle(
                                  color: Colors.red[700],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Assine para continuar usando o Locare.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                      const SizedBox(height: 16),
                      if (!isPremium)
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () => context.push('/assinatura'),
                            icon: const Icon(Icons.star),
                            label: const Text('Assinar Agora'),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Opções
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.description_outlined),
                      title: const Text('Termos de Uso'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.push('/termos-uso'),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.privacy_tip_outlined),
                      title: const Text('Política de Privacidade'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.push('/politica-privacidade'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Ações perigosas
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.logout, color: Colors.orange[700]),
                      title: Text(
                        'Sair da Conta',
                        style: TextStyle(color: Colors.orange[700]),
                      ),
                      onTap: () => _handleLogout(context, ref),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading:
                          Icon(Icons.delete_forever, color: Colors.red[700]),
                      title: Text(
                        'Excluir Minha Conta',
                        style: TextStyle(color: Colors.red[700]),
                      ),
                      onTap: () => _handleDeleteAccount(context, ref),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Versão
              Center(
                child: Text(
                  'Locare v1.0.0',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erro: $e')),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  Future<void> _handleLogout(BuildContext context, WidgetRef ref) async {
    final ok = await confirmDialog(
      context,
      title: 'Sair da conta',
      message: 'Deseja realmente sair?',
    );
    if (!ok) return;

    final authService = AuthService();
    await authService.logout();

    ref.read(dataRefreshProvider.notifier).state++;

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

  Future<void> _handleDeleteAccount(BuildContext context, WidgetRef ref) async {
    // Primeira confirmação
    final ok1 = await confirmDialog(
      context,
      title: 'Excluir conta',
      message: 'ATENÇÃO: Esta ação é irreversível!\n\n'
          'Todos os seus dados serão permanentemente excluídos:\n'
          '• Imobiliárias\n'
          '• Casas\n'
          '• Locatários\n'
          '• Vínculos\n'
          '• Pagamentos\n\n'
          'Deseja continuar?',
    );
    if (!ok1 || !context.mounted) return;

    // Segunda confirmação
    final ok2 = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirmar exclusão'),
        content: const Text(
          'Digite "EXCLUIR" para confirmar a exclusão da sua conta:',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
    if (ok2 != true || !context.mounted) return;

    // TODO: Implementar exclusão da conta no Supabase
    // Por enquanto, apenas mostra mensagem
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
            'Funcionalidade em desenvolvimento. Entre em contato pelo suporte.'),
      ),
    );
  }
}
