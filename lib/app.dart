import 'package:flutter/material.dart';

import 'core/router/app_router.dart';
import 'theme/app_theme.dart';

class TreinoSaasApp extends StatelessWidget {
  const TreinoSaasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Treino SaaS',
      theme: AppTheme.light(),
      routerConfig: AppRouter.config,
      debugShowCheckedModeBanner: false,
    );
  }
}
