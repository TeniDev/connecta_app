import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/base/base.dart';
import '../data/providers/providers.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService(ref));

class AuthService implements AuthBaseRepository {
  AuthService(this.ref);

  final Ref ref;

  @override
  Future<String> logIn({required String email, required String password}) async {
    try {
      await ref.read(authProvider).signInWithEmailAndPassword(
            email: email.trim(),
            password: password,
          );

      return '';
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await ref.read(authProvider).signOut();
  }

  @override
  Future<String> signUp({required String email, required String password}) async {
    try {
      await ref.read(authProvider).createUserWithEmailAndPassword(
            email: email.trim(),
            password: password,
          );

      return '';
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      rethrow;
    }
  }

  @override
  String? getCurrentUser() {
    return ref.read(authProvider).currentUser?.uid;
  }
}
