import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_profile.dart';

final sessionControllerProvider =
    StateNotifierProvider<SessionController, UserProfile?>(
  (ref) => SessionController(),
);

class SessionController extends StateNotifier<UserProfile?> {
  SessionController() : super(null);

  void setUser(UserProfile profile) => state = profile;

  void clear() => state = null;
}
