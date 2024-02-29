import 'package:go_router/go_router.dart';
import 'package:gradution_app/features/auth/presentation/views/forget_password_view.dart';
import 'package:gradution_app/features/auth/presentation/views/new_password_view.dart';
import 'package:gradution_app/features/auth/presentation/views/password_changed_view.dart';
import 'package:gradution_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:gradution_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:gradution_app/features/auth/presentation/views/verify_code_view.dart';
import 'package:gradution_app/features/choose/views/choose_view.dart';
import 'package:gradution_app/features/home/presentation/views/home_view.dart';
import 'package:gradution_app/features/quiz/presentation/views/animal_quiz_view.dart';
import 'package:gradution_app/features/quiz/presentation/views/food_quiz_eight_view.dart';
import 'package:gradution_app/features/quiz/presentation/views/food_quiz_final_view.dart';
import 'package:gradution_app/features/quiz/presentation/views/food_quiz_five_view.dart';
import 'package:gradution_app/features/quiz/presentation/views/food_quiz_four_view.dart';
import 'package:gradution_app/features/quiz/presentation/views/food_quiz_nine_view.dart';
import 'package:gradution_app/features/quiz/presentation/views/food_quiz_one_view.dart';
import 'package:gradution_app/features/quiz/presentation/views/food_quiz_seven_view.dart';
import 'package:gradution_app/features/quiz/presentation/views/food_quiz_six_view.dart';
import 'package:gradution_app/features/quiz/presentation/views/food_quiz_three_view.dart';
import 'package:gradution_app/features/quiz/presentation/views/food_quiz_two_view.dart';
import 'package:gradution_app/features/quiz/presentation/views/number_quiz_view.dart';
import 'package:gradution_app/features/quiz/presentation/views/other_things_quiz.dart';
import 'package:gradution_app/features/quiz/presentation/views/quiz_view.dart';
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
  static const String quizView = '/quizView';
  static const String foodQuizViewOne = '/foodQuizViewOne';
  static const String foodQuizViewTwo = '/foodQuizViewTwo';
  static const String foodQuizViewThree = '/foodQuizViewThree';
  static const String foodQuizViewFour = '/foodQuizViewFour';
  static const String foodQuizViewFive = '/foodQuizViewFive';
  static const String foodQuizViewSix = '/foodQuizViewSix';
  static const String foodQuizViewSeven = '/foodQuizViewSeven';
  static const String foodQuizViewEight = '/foodQuizViewEight';
  static const String foodQuizViewNine = '/foodQuizViewNine';
  static const String foodQuizViewFinal = '/foodQuizViewFinal';
  static const String animalQuizView = '/animalQuizView';
  static const String numberQuizView = '/numberQuizView';
  static const String otherThingsQuizView = '/otherThingsQuizView';
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
    GoRoute(
      path: quizView,
      builder: (context, state) => const QuizView(),
    ),
    GoRoute(
      path: foodQuizViewOne,
      builder: (context, state) => const FoodQuizViewOne(),
    ),
    GoRoute(
      path: foodQuizViewTwo,
      builder: (context, state) => const FoodQuizViewTwo(),
    ),
    GoRoute(
      path: foodQuizViewThree,
      builder: (context, state) => const FoodQuizViewThree(),
    ),
    GoRoute(
      path: foodQuizViewFour,
      builder: (context, state) => const FoodQuizViewFour(),
    ),
    GoRoute(
      path: foodQuizViewFive,
      builder: (context, state) => const FoodQuizViewFive(),
    ),
    GoRoute(
      path: foodQuizViewSix,
      builder: (context, state) => const FoodQuizViewSix(),
    ),
    GoRoute(
      path: foodQuizViewSeven,
      builder: (context, state) => const FoodQuizViewSeven(),
    ),
    GoRoute(
      path: foodQuizViewEight,
      builder: (context, state) => const FoodQuizViewEight(),
    ),
    GoRoute(
      path: foodQuizViewNine,
      builder: (context, state) => const FoodQuizViewNine(),
    ),
    GoRoute(
      path: foodQuizViewFinal,
      builder: (context, state) => const FoodQuizFinalView(),
    ),
    GoRoute(
      path: animalQuizView,
      builder: (context, state) => const AnimalQuizView(),
    ),
    GoRoute(
      path: numberQuizView,
      builder: (context, state) => const NumberQuizView(),
    ),
    GoRoute(
      path: otherThingsQuizView,
      builder: (context, state) => const OtherThingsQuizView(),
    ),
  ]);
}
