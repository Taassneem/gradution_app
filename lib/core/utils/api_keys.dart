class EndPoint {
  static const String baseUrl = 'https://c4b6-156-210-187-72.ngrok-free.app/';
  static const String signUp = 'auth/';
  static const String login = 'auth/login';
  static const String reset = 'auth/forget';
  static const String forget = 'auth/reset';
  static String confirm(token) {
    return 'auth/confirm/$token';
  }

  static const String categories = 'blog/getTodos';
  static const String addTask = 'blog/add';
  static String getTasks(id) {
    return 'blog/createdBy/$id';
  }
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
  static const String title = 'title';
  static const String image = 'image';
  static const String selectedActivity = 'selectedActivity';
  static const String daysOfWeek = 'daysOfWeek';
  static const String date = 'date';
  static const String reminder = 'reminder';
  static const String time = 'time';
}
