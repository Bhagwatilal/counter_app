import 'package:counter_app/domain/repository/i_login_form_repository.dart';
import 'package:counter_app/infrastructure/data_source/login_api.dart';

class LoginFormRepository implements ILoginFormRepository {
  final _loginApi =
      LoginApi(); // Assuming you have a LoginApi class for API calls
  @override
  Future<bool> login(
      {required String username, required String password}) async {
    try {
      final result = await _loginApi.login(username, password);
      return true;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    return false;
  }

  @override
  Future<void> logout() async {}

  @override
  Future<bool> storetoken(String token) async {
    // Implement logic to store the token
    return true; // Example: return true if token is stored successfully
  }
}
