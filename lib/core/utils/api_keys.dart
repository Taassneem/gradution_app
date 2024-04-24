class EndPoint {
  static const String baseUrl = 'https://bc13-197-54-175-139.ngrok-free.app/';
  static const String signUp = 'auth/';
  static const String login = 'auth/login';
  static const String reset = 'auth/forget';
  static const String forget = 'auth/reset';
  static String confirm(token) {
    return 'auth/confirm/$token';
  }
  static const String categories = 'blog/getTodos';
}

class ApiKey {
  static const String cause = 'cause';
  static const String message = 'message';
  static const String savedUser = 'savedUser';
  static const String userName = 'userName';
  static const String email = 'email';
  static const String password = 'password';
  static const String id = '_id';
  static const String token = 'token';
  static const String confirmPassword = 'confirmPassword';
}
