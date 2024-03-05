class EndPoint {
  static const String baseUrl = 'https://0e59-156-210-150-229.ngrok-free.app/';
  static const String signUp = 'auth/';
  static const String login = 'auth/login';
  static const String reset = 'auth/forget';
  static const String forget = 'auth/reset';
  static String confirm(tokren) {
    return 'auth/confirm/$tokren';
  }
}

class ApiKey {
  static const String message = 'message';
  static const String savedUser = 'savedUser';
  static const String userName = 'userName';
  static const String email = 'email';
  static const String password = 'password';
  static const String id = '_id';
  static const String confirmpassword = 'confirmpassword';
}