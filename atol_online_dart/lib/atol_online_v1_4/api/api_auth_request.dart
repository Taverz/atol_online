

abstract class ApiRequestAtolAuth {
  ApiRequestAtolAuth();
  Future<String> getAuthToken({
    required String login,
    required String password,
  });
}
