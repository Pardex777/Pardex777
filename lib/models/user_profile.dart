enum UserRole { personal, aluno }

class UserProfile {
  const UserProfile({
    required this.id,
    required this.email,
    required this.role,
    required this.subscriptionActive,
  });

  final String id;
  final String email;
  final UserRole role;
  final bool subscriptionActive;

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map['id'] as String,
      email: map['email'] as String,
      role: map['role'] == 'personal' ? UserRole.personal : UserRole.aluno,
      subscriptionActive: map['subscription_active'] as bool? ?? false,
    );
  }
}
