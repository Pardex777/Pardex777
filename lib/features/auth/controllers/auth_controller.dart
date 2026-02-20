import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/supabase_service.dart';

final authControllerProvider = Provider<AuthController>((ref) {
  return AuthController();
});

class AuthController {
  Future<void> signIn({required String email, required String password}) async {
    await SupabaseService.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> recoverPassword(String email) async {
    await SupabaseService.client.auth.resetPasswordForEmail(email);
  }
}
