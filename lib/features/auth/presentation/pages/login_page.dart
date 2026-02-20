import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../components/primary_button.dart';
import '../../../../models/user_profile.dart';
import '../../../auth/controllers/auth_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Entrar')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              label: 'Entrar',
              onPressed: () async {
                await ref.read(authControllerProvider).signIn(
                      email: _emailController.text.trim(),
                      password: _passwordController.text,
                    );

                final role = _emailController.text.contains('personal')
                    ? UserRole.personal
                    : UserRole.aluno;

                if (!context.mounted) {
                  return;
                }

                context.go(role == UserRole.personal ? '/personal' : '/aluno');
              },
              icon: Icons.login,
            ),
            TextButton(
              onPressed: () {
                ref
                    .read(authControllerProvider)
                    .recoverPassword(_emailController.text.trim());
              },
              child: const Text('Recuperar senha'),
            ),
          ],
        ),
      ),
    );
  }
}
