// src/presentation/widgets/app_scaffold.dart
// Shell com NavigationBar (6 abas). onTap troca rota conforme índice.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/auth/auth_service.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  const AppScaffold({super.key, required this.child});

  static const _tabs = [
    ('/', 'Início', Icons.space_dashboard_outlined),
    ('/imobiliarias', 'Imobiliárias', Icons.business_outlined),
    ('/casas', 'Casas', Icons.home_outlined),
    ('/locatarios', 'Locatários', Icons.people_outline),
    ('/vinculos', 'Vínculos', Icons.link_outlined),
    ('/resumo', 'Resumo', Icons.receipt_long_outlined),
  ];

  int _indexFromLocation(String location) {
    final i = _tabs.indexWhere((t) => location == t.$1);
    return i >= 0 ? i : 0;
  }

  Future<void> _handleLogout(BuildContext context) async {
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
      if (context.mounted) {
        context.go('/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _indexFromLocation(location);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Locare Admin'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sair',
            onPressed: () => _handleLogout(context),
          ),
        ],
      ),
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (i) => context.go(_tabs[i].$1),
        destinations: _tabs
            .map((t) => NavigationDestination(icon: Icon(t.$3), label: t.$2))
            .toList(),
      ),
    );
  }
}
