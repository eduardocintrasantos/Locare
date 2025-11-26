// src/presentation/widgets/app_scaffold.dart
// Shell com NavigationBar (6 abas). onTap troca rota conforme índice.
// Inclui verificação de acesso (trial ou premium).

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'access_guard.dart';

class AppScaffold extends ConsumerWidget {
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _indexFromLocation(location);

    return AccessGuard(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Locare'),
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle_outlined),
              tooltip: 'Minha Conta',
              onPressed: () => context.push('/conta'),
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
      ),
    );
  }
}
