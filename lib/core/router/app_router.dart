import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/personal/presentation/pages/personal_dashboard_page.dart';
import '../../features/student/presentation/pages/student_home_page.dart';

class AppRouter {
  AppRouter._();

  static final config = GoRouter(
    initialLocation: '/login',
    routes: <RouteBase>[
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) =>
            const LoginPage(),
      ),
      GoRoute(
        path: '/personal',
        builder: (BuildContext context, GoRouterState state) =>
            const PersonalDashboardPage(),
      ),
      GoRoute(
        path: '/aluno',
        builder: (BuildContext context, GoRouterState state) =>
            const StudentHomePage(),
      ),
    ],
  );
}
