abstract class AuthBaseRepository {
  String? getCurrentUser();
  Future<String> logIn({required String email, required String password});
  Future<String> signUp({required String email, required String password});
  Future<void> signOut();
}
