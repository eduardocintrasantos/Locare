// src/app/router/app_router.dart
// Agora inclui rotas de criação/edição para cada módulo.

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
import '../../../presentation/screens/conta/conta_screen.dart';
import '../../../presentation/screens/acesso/acesso_bloqueado_screen.dart';
import '../../../presentation/screens/assinatura/assinatura_screen.dart';
import '../../../presentation/screens/login_screen.dart';
import '../../../presentation/screens/cadastro/cadastro_screen.dart';
import '../../../presentation/screens/termos/termos_uso_screen.dart';
import '../../../presentation/screens/termos/politica_privacidade_screen.dart';
import '../../auth/auth_service.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    final authService = AuthService();
    final isAuthenticated = authService.isAuthenticated;
    final isLoginRoute = state.matchedLocation == '/login';
    final isCadastroRoute = state.matchedLocation == '/cadastro';
    final isTermosRoute = state.matchedLocation == '/termos-uso';
    final isPoliticaRoute = state.matchedLocation == '/politica-privacidade';

    // Se não está autenticado e não está em rota pública, redireciona para login
    if (!isAuthenticated &&
        !isLoginRoute &&
        !isCadastroRoute &&
        !isTermosRoute &&
        !isPoliticaRoute) {
      return '/login';
    }

    // Se está autenticado e está tentando acessar login ou cadastro, redireciona para home
    if (isAuthenticated && (isLoginRoute || isCadastroRoute)) {
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

    // Rota de Cadastro (fora do ShellRoute)
    GoRoute(
      path: '/cadastro',
      name: 'cadastro',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: CadastroScreen()),
    ),

    // Rota de Termos de Uso
    GoRoute(
      path: '/termos-uso',
      name: 'termos-uso',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: TermosUsoScreen()),
    ),

    // Rota de Política de Privacidade
    GoRoute(
      path: '/politica-privacidade',
      name: 'politica-privacidade',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: PoliticaPrivacidadeScreen()),
    ),

    // Rota de Acesso Bloqueado (quando trial expira)
    GoRoute(
      path: '/acesso-bloqueado',
      name: 'acesso-bloqueado',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: AcessoBloqueadoScreen()),
    ),

    // Rota de Assinatura/Planos
    GoRoute(
      path: '/assinatura',
      name: 'assinatura',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: AssinaturaScreen()),
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
        GoRoute(
          path: '/conta',
          name: 'conta',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ContaScreen()),
        ),
      ],
    ),
  ],
);
