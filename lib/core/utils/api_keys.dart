class EndPoint {
  static const String signUp =
      'https://graduation-project-34w2.onrender.com/auth/';
  static const String login =
      'https://graduation-project-34w2.onrender.com/auth/login';
  static const String forget =
      'https://graduation-project-34w2.onrender.com/auth/forget';
  static const String reset =
      'https://graduation-project-34w2.onrender.com/auth/reset';

  static const String categories =
      'https://graduation-project-34w2.onrender.com/blog/getTodos';
  static const String addTask =
      'https://graduation-project-34w2.onrender.com/blog/add';
  static String getTasks(id) {
    return 'https://graduation-project-34w2.onrender.com/blog/createdBy/$id';
  }

  static String editTasks(id) {
    return 'https://graduation-project-34w2.onrender.com/blog/updateBlog/$id';
  }

  static String deteleTask(id) {
    return 'https://graduation-project-34w2.onrender.com/blog/deleteBlog/$id';
  }

  static String changePassword(id) {
    return 'https://graduation-project-34w2.onrender.com/user/changePassword/$id';
  }

  static const String logOut =
      'https://graduation-project-34w2.onrender.com/user/logout';
  static String editProfile(id) {
    return 'https://graduation-project-34w2.onrender.com/user/editProfile/$id';
  }

  static String editProfilePic(id) {
    return 'https://graduation-project-34w2.onrender.com/user/updateprofilepic/$id';
  }

  static String uploadProfilepic(id) {
    return 'https://graduation-project-34w2.onrender.com/user/profilepic/$id';
  }

  static String deleteUser(id) {
    return 'https://graduation-project-34w2.onrender.com/user/deleteUser/$id';
  }

  static String getuserById(id) {
    return 'https://graduation-project-34w2.onrender.com/user/getuserById/$id';
  }

  static const String modelAi = 'http://144.24.219.44:5050/predict';
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
  static const String acceptLanguage = 'Accept-Language';
  static const String confirmPassword = 'confirmPassword';
  static const String confirmPasswordReset = 'confirmPassword';
  static const String oldPassword = 'oldPassword';
  static const String userId = 'userId';
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
  static const String changeLan = 'changeLan';
  static const String childChoosen = 'childChoosen';
  static const String parentChoosen = 'parentChoosen';
  static const String languageCode = 'languageCode';
}
