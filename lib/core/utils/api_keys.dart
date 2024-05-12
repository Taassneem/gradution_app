class EndPoint {
  static const String baseUrl = 'https://6b27-197-53-100-101.ngrok-free.app/';
  static const String signUp = 'auth/';
  static const String login = 'auth/login';
  static const String forget = 'auth/forget';
  static const String reset = 'auth/reset';

  static const String categories = 'blog/getTodos';
  static const String addTask = 'blog/add';
  static String getTasks(id) {
    return 'blog/createdBy/$id';
  }

  static String editTasks(id) {
    return 'blog/updateBlog/$id';
  }

  static String deteleTask(id) {
    return 'blog/deleteBlog/$id';
  }

  static const String modelAi = '/predict';
}

class ApiKey {
  static const String cause = 'cause';
  static const String message = 'message';
  static const String savedUser = 'savedUser';
  static const String userName = 'userName';
  static const String email = 'email';
  static const String password = 'password';
  static const String loginId = 'loginId';
  static const String loginToken = 'token';
  static const String forgetCode = 'forgetCode';
  static const String newPassword = 'newPassword';
  static const String authorization = 'Authorization';
  static const String confirmPassword = 'confirmPassword';
  static const String confirmPasswordReset = 'confirmpassword';
  static const String title = 'title';
  static const String image = 'image';
  static const String selectedActivity = 'selectedActivity';
  static const String daysOfWeek = 'daysOfWeek';
  static const String reminder = 'reminder';
  static const String repeater = 'repeater';
  static const String date = 'date';
  static const String time = 'time';
  static const String taskId = 'taskId';
  static const String imageAi = 'image_data';
}

class CacheHelperKey {
  static const String selectedDays = 'selectedDays';
  static const String onBoardingVisited = 'onBoardingVisited';
  static const String languageChoosed = 'languageChoosed';
  static const String signedIn = 'signedIn';
  static const String signedUp = 'signedUp';
  static const String isArabic = 'isArabic';
  static const String isEnglish = 'isEnglish';
}
