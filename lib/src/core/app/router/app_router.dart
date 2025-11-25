// src/app/router/app_router.dart
// Agora inclui rotas de criação/edição para cada módulo.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../presentation/widgets/app_scaffold.dart';
import '../../../presentation/screens/dashboard/dashboard_screen.dart';
import '../../../presentation/screens/imobiliarias/imobiliarias_list_screen.dart';
import '../../../presentation/screens/imobiliarias/imobiliaria_form_screen.dart';
import '../../../presentation/screens/casas/casas_list_screen.dart';
import '../../../presentation/screens/casas/casa_form_screen.dart';
import '../../../presentation/screens/locatarios/locatarios_list_screen.dart';
import '../../../presentation/screens/locatarios/locatario_form_screen.dart';
import '../../../presentation/screens/vinculos/vinculos_list_screen.dart';
import '../../../presentation/screens/vinculos/vinculo_form_screen.dart';
import '../../../presentation/screens/resumo/resumo_financeiro_screen.dart';
import '../../../presentation/screens/login_screen.dart';
import '../../auth/auth_service.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    final authService = AuthService();
    final isAuthenticated = authService.isAuthenticated;
    final isLoginRoute = state.matchedLocation == '/login';

    // Se não está autenticado e não está na tela de login, redireciona para login
    if (!isAuthenticated && !isLoginRoute) {
      return '/login';
    }

    // Se está autenticado e está tentando acessar login, redireciona para home
    if (isAuthenticated && isLoginRoute) {
      return '/';
    }

    return null; // Não redireciona
  },
  routes: [
    // Rota de Login (fora do ShellRoute)
    GoRoute(
      path: '/login',
      name: 'login',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: LoginScreen()),
    ),

    // Rotas protegidas (dentro do ShellRoute)
    ShellRoute(
      builder: (context, state, child) => AppScaffold(child: child),
      routes: [
        GoRoute(
          path: '/',
          name: 'dashboard',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: DashboardScreen()),
        ),
        GoRoute(
          path: '/imobiliarias',
          name: 'imobiliarias',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ImobiliariasListScreen()),
          routes: [
            GoRoute(
              path: 'new',
              name: 'imobiliaria-new',
              builder: (_, __) => const ImobiliariaFormScreen(),
            ),
            GoRoute(
              path: ':id',
              name: 'imobiliaria-edit',
              builder: (_, st) => ImobiliariaFormScreen(
                  id: int.tryParse(st.pathParameters['id'] ?? '')),
            ),
          ],
        ),
        GoRoute(
          path: '/casas',
          name: 'casas',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: CasasListScreen()),
          routes: [
            GoRoute(
              path: 'new',
              name: 'casa-new',
              builder: (_, __) => const CasaFormScreen(),
            ),
            GoRoute(
              path: ':id',
              name: 'casa-edit',
              builder: (_, st) => CasaFormScreen(
                  id: int.tryParse(st.pathParameters['id'] ?? '')),
            ),
          ],
        ),
        GoRoute(
          path: '/locatarios',
          name: 'locatarios',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: LocatariosListScreen()),
          routes: [
            GoRoute(
              path: 'new',
              name: 'locatario-new',
              builder: (_, __) => const LocatarioFormScreen(),
            ),
            GoRoute(
              path: ':id',
              name: 'locatario-edit',
              builder: (_, st) => LocatarioFormScreen(
                  id: int.tryParse(st.pathParameters['id'] ?? '')),
            ),
          ],
        ),
        GoRoute(
          path: '/vinculos',
          name: 'vinculos',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: VinculosListScreen()),
          routes: [
            GoRoute(
              path: 'new',
              name: 'vinculo-new',
              builder: (_, __) => const VinculoFormScreen(),
            ),
            GoRoute(
              path: ':id',
              name: 'vinculo-edit',
              builder: (_, st) => VinculoFormScreen(
                  id: int.tryParse(st.pathParameters['id'] ?? '')),
            ),
          ],
        ),
        GoRoute(
          path: '/resumo',
          name: 'resumo',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ResumoFinanceiroScreen()),
        ),
      ],
    ),
  ],
);
