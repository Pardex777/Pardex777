import '../../domain/entities/auth_user.dart';

abstract class AuthRepository {
  Future<AuthUser?> currentUser();
}
