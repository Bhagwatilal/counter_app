abstract class ILoginFormRepository {
  Future<bool> login({required String username, required String password});
  Future<void> logout();
  Future<bool> isLoggedIn();
  Future<bool> storetoken(String token);
}
