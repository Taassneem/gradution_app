import 'package:go_router/go_router.dart';
import 'package:gradution_app/features/auth/presentation/views/forget_password_view.dart';
import 'package:gradution_app/features/auth/presentation/views/new_password_view.dart';
import 'package:gradution_app/features/auth/presentation/views/password_changed_view.dart';
import 'package:gradution_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:gradution_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:gradution_app/features/auth/presentation/views/verify_code_view.dart';
import 'package:gradution_app/features/choose/views/choose_view.dart';
import 'package:gradution_app/features/home/presentation/views/home_view.dart';
import 'package:gradution_app/features/splash/presentation/views/splash_view.dart';

import '../../features/Onboarding/presentation/views/on_boarding_view.dart';

class AppRouter {
  static const String signInView = '/signInView';
  static const String signUpView = '/signUpView';
  static const String forgetPassView = '/forgetPassView';
  static const String newPassView = '/newPassView';
  static const String verifyCodeView = '/verificationCodeView';
  static const String homeView = '/homeView';
  static const String passwordChanged = '/passwordChanged';
  static const String onBoardingView = '/onBoardingView';
  static const String chooseView = '/chooseView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: signInView,
      builder: (context, state) => const SignInView(),
    ),
    GoRoute(
      path: signUpView,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: newPassView,
      builder: (context, state) => const NewPasswordView(),
    ),
    GoRoute(
      path: forgetPassView,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(
      path: verifyCodeView,
      builder: (context, state) => const VerifyCodeView(),
    ),
    GoRoute(
      path: passwordChanged,
      builder: (context, state) => const PasswordChanged(),
    ),
    GoRoute(
      path: homeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: onBoardingView,
      builder: (context, state) => OnBoardingView(),
    ),
    GoRoute(
      path: chooseView,
      builder: (context, state) => const ChooseView(),
    ),
  ]);
}
