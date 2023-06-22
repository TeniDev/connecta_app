import 'package:riverpod/riverpod.dart';

final userSessionProvider = NotifierProvider<_SessionProvider, String?>(() => _SessionProvider());

class _SessionProvider extends Notifier<String?> {
  @override
  String? build() {
    return null;
  }
}
