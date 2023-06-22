import 'package:riverpod/riverpod.dart';

import '../models/models.dart';

final userSessionProvider = NotifierProvider<_SessionProvider, UserModel?>(() => _SessionProvider());

class _SessionProvider extends Notifier<UserModel?> {
  @override
  UserModel? build() {
    return null;
  }

  void setUser(UserModel user) {
    state = user;
  }

  void removeUser() {
    state = null;
  }
}
