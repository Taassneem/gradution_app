import 'package:go_router/go_router.dart';
import 'package:gradution_app/features/Onboarding/presentation/views/on_boarding_view.dart';
import 'package:gradution_app/features/auth/presentation/views/forget_password_view.dart';
import 'package:gradution_app/features/auth/presentation/views/new_password_view.dart';
import 'package:gradution_app/features/auth/presentation/views/password_changed_view.dart';
import 'package:gradution_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:gradution_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:gradution_app/features/auth/presentation/views/verify_code_view.dart';
import 'package:gradution_app/features/choose/views/choose_view.dart';
import 'package:gradution_app/features/home/presentation/views/home_view.dart';
import 'package:gradution_app/features/quiz/animals/views/animal_quiz_eight_view.dart';
import 'package:gradution_app/features/quiz/animals/views/animal_quiz_final_view.dart';
import 'package:gradution_app/features/quiz/animals/views/animal_quiz_five_view.dart';
import 'package:gradution_app/features/quiz/animals/views/animal_quiz_four_view.dart';
import 'package:gradution_app/features/quiz/animals/views/animal_quiz_nine_view.dart';
import 'package:gradution_app/features/quiz/animals/views/animal_quiz_one_view.dart';
import 'package:gradution_app/features/quiz/animals/views/animal_quiz_seven_view.dart';
import 'package:gradution_app/features/quiz/animals/views/animal_quiz_six_view.dart';
import 'package:gradution_app/features/quiz/animals/views/animal_quiz_three_view.dart';
import 'package:gradution_app/features/quiz/animals/views/animal_quiz_two_view.dart';
import 'package:gradution_app/features/quiz/foodAndDrink/views/food_quiz_eight_view.dart';
import 'package:gradution_app/features/quiz/foodAndDrink/views/food_quiz_final_view.dart';
import 'package:gradution_app/features/quiz/foodAndDrink/views/food_quiz_five_view.dart';
import 'package:gradution_app/features/quiz/foodAndDrink/views/food_quiz_four_view.dart';
import 'package:gradution_app/features/quiz/foodAndDrink/views/food_quiz_nine_view.dart';
import 'package:gradution_app/features/quiz/foodAndDrink/views/food_quiz_one_view.dart';
import 'package:gradution_app/features/quiz/foodAndDrink/views/food_quiz_seven_view.dart';
import 'package:gradution_app/features/quiz/foodAndDrink/views/food_quiz_six_view.dart';
import 'package:gradution_app/features/quiz/foodAndDrink/views/food_quiz_three_view.dart';
import 'package:gradution_app/features/quiz/foodAndDrink/views/food_quiz_two_view.dart';
import 'package:gradution_app/features/quiz/numbers/views/number_quiz_eight_view.dart';
import 'package:gradution_app/features/quiz/numbers/views/number_quiz_final_view.dart';
import 'package:gradution_app/features/quiz/numbers/views/number_quiz_five_view.dart';
import 'package:gradution_app/features/quiz/numbers/views/number_quiz_four_view.dart';
import 'package:gradution_app/features/quiz/numbers/views/number_quiz_nine_view.dart';
import 'package:gradution_app/features/quiz/numbers/views/number_quiz_seven_view.dart';
import 'package:gradution_app/features/quiz/numbers/views/number_quiz_six_view.dart';
import 'package:gradution_app/features/quiz/numbers/views/number_quiz_three_view.dart';
import 'package:gradution_app/features/quiz/numbers/views/number_quiz_two_view.dart';
import 'package:gradution_app/features/quiz/numbers/views/number_quiz_one_view.dart';
import 'package:gradution_app/features/quiz/ontherThings/views/things_quiz_one_view.dart';
import 'package:gradution_app/features/quiz/ontherThings/views/things_quiz_eight_view.dart';
import 'package:gradution_app/features/quiz/ontherThings/views/things_quiz_final_view.dart';
import 'package:gradution_app/features/quiz/ontherThings/views/things_quiz_five_view.dart';
import 'package:gradution_app/features/quiz/ontherThings/views/things_quiz_four_view.dart';
import 'package:gradution_app/features/quiz/ontherThings/views/things_quiz_nine_view.dart';
import 'package:gradution_app/features/quiz/ontherThings/views/things_quiz_seven_view.dart';
import 'package:gradution_app/features/quiz/ontherThings/views/things_quiz_six_view.dart';
import 'package:gradution_app/features/quiz/ontherThings/views/things_quiz_ten_view_body.dart';
import 'package:gradution_app/features/quiz/ontherThings/views/things_quiz_three_view.dart';
import 'package:gradution_app/features/quiz/ontherThings/views/things_quiz_two_view.dart';
import 'package:gradution_app/features/quiz/presentation/views/quiz_view.dart';
import 'package:gradution_app/features/splash/presentation/views/splash_view.dart';

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
  static const String animalQuizViewOne = '/animalQuizViewOne';
  static const String animalQuizViewTwo = '/animalQuizViewTwo';
  static const String animalQuizViewThree = '/animalQuizViewThree';
  static const String animalQuizViewFour = '/animalQuizViewFour';
  static const String animalQuizViewFive = '/animalQuizViewFive';
  static const String animalQuizViewSix = '/animalQuizViewSix';
  static const String animalQuizViewSeven = '/animalQuizViewSeven';
  static const String animalQuizViewEight = '/animalQuizViewEight';
  static const String animalQuizViewNine = '/animalQuizViewNine';
  static const String animalQuizViewFinal = '/animalQuizViewFinal';
  static const String otherThingsQuizViewOne = '/otherThingsQuizViewOne';
  static const String otherThingsQuizViewTwo = '/otherThingsQuizViewTwo';
  static const String otherThingsQuizViewThree = '/otherThingsQuizViewThree';
  static const String otherThingsQuizViewFour = '/otherThingsQuizViewFour';
  static const String otherThingsQuizViewFive = '/otherThingsQuizViewFive';
  static const String otherThingsQuizViewSix = '/otherThingsQuizViewSix';
  static const String otherThingsQuizViewSeven = '/otherThingsQuizViewSeven';
  static const String otherThingsQuizViewEight = '/otherThingsQuizViewEight';
  static const String otherThingsQuizViewNine = '/otherThingsQuizViewNine';
  static const String otherThingsQuizViewTen = '/otherThingsQuizViewTen';
  static const String otherThingsQuizViewFinal = '/otherThingsQuizViewFinal';
  static const String numberQuizViewOne = '/numberQuizViewOne';
  static const String numberQuizViewTwo = '/numberQuizViewTwo';
  static const String numberQuizViewThree = '/numberQuizViewThree';
  static const String numberQuizViewFour = '/numberQuizViewFour';
  static const String numberQuizViewFive = '/numberQuizViewFive';
  static const String numberQuizViewSix = '/numberQuizViewSix';
  static const String numberQuizViewSeven = '/numberQuizViewSeven';
  static const String numberQuizViewEight = '/numberQuizViewEight';
  static const String numberQuizViewNine = '/numberQuizViewNine';
  static const String numberQuizViewFinal = '/numberQuizViewFinal';
  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(path: signInView, builder: (context, state) => const SignInView()),
    GoRoute(path: signUpView, builder: (context, state) => const SignUpView()),
    GoRoute(
        path: newPassView,
        builder: (context, state) => const NewPasswordView()),
    GoRoute(
        path: forgetPassView,
        builder: (context, state) => const ForgetPasswordView()),
    GoRoute(
        path: verifyCodeView,
        builder: (context, state) => const VerifyCodeView()),
    GoRoute(
        path: passwordChanged,
        builder: (context, state) => const PasswordChanged()),
    GoRoute(path: homeView, builder: (context, state) => const HomeView()),
    GoRoute(
        path: onBoardingView, builder: (context, state) => OnBoardingView()),
    GoRoute(path: chooseView, builder: (context, state) => const ChooseView()),
    GoRoute(path: quizView, builder: (context, state) => const QuizView()),
    GoRoute(
        path: foodQuizViewOne,
        builder: (context, state) => const FoodQuizViewOne()),
    GoRoute(
        path: foodQuizViewTwo,
        builder: (context, state) => const FoodQuizViewTwo()),
    GoRoute(
        path: foodQuizViewThree,
        builder: (context, state) => const FoodQuizViewThree()),
    GoRoute(
        path: foodQuizViewFour,
        builder: (context, state) => const FoodQuizViewFour()),
    GoRoute(
        path: foodQuizViewFive,
        builder: (context, state) => const FoodQuizViewFive()),
    GoRoute(
        path: foodQuizViewSix,
        builder: (context, state) => const FoodQuizViewSix()),
    GoRoute(
        path: foodQuizViewSeven,
        builder: (context, state) => const FoodQuizViewSeven()),
    GoRoute(
        path: foodQuizViewEight,
        builder: (context, state) => const FoodQuizViewEight()),
    GoRoute(
        path: foodQuizViewNine,
        builder: (context, state) => const FoodQuizViewNine()),
    GoRoute(
        path: foodQuizViewFinal,
        builder: (context, state) => const FoodQuizFinalView()),
    GoRoute(
        path: animalQuizViewOne,
        builder: (context, state) => const AnimalQuizOneView()),
    GoRoute(
        path: animalQuizViewTwo,
        builder: (context, state) => const AnimalQuizTwoView()),
    GoRoute(
        path: animalQuizViewThree,
        builder: (context, state) => const AnimalQuizThreeView()),
    GoRoute(
        path: animalQuizViewFour,
        builder: (context, state) => const AnimalQuizFourView()),
    GoRoute(
        path: animalQuizViewFive,
        builder: (context, state) => const AnimalQuizFiveView()),
    GoRoute(
        path: animalQuizViewSix,
        builder: (context, state) => const AnimalQuizSixView()),
    GoRoute(
        path: animalQuizViewSeven,
        builder: (context, state) => const AnimalQuizSevenView()),
    GoRoute(
        path: animalQuizViewEight,
        builder: (context, state) => const AnimalQuizEightView()),
    GoRoute(
        path: animalQuizViewNine,
        builder: (context, state) => const AnimalQuizNineView()),
    GoRoute(
        path: animalQuizViewFinal,
        builder: (context, state) => const AnimalQuizFinalView()),
    GoRoute(
        path: numberQuizViewOne,
        builder: (context, state) => const NumberQuizView()),
    GoRoute(
        path: numberQuizViewTwo,
        builder: (context, state) => const NumberQuizTwoView()),
    GoRoute(
        path: numberQuizViewThree,
        builder: (context, state) => const NumberQuizThreeView()),
    GoRoute(
        path: numberQuizViewFour,
        builder: (context, state) => const NumberQuizFourView()),
    GoRoute(
        path: numberQuizViewFive,
        builder: (context, state) => const NumberQuizFiveView()),
    GoRoute(
        path: numberQuizViewSix,
        builder: (context, state) => const NumberQuizSixView()),
    GoRoute(
        path: numberQuizViewSeven,
        builder: (context, state) => const NumberQuizSevenView()),
    GoRoute(
        path: numberQuizViewEight,
        builder: (context, state) => const NumberQuizEightView()),
    GoRoute(
        path: numberQuizViewNine,
        builder: (context, state) => const NumberQuizNineView()),
    GoRoute(
        path: numberQuizViewFinal,
        builder: (context, state) => const NumberQuizFinalView()),
    GoRoute(
        path: otherThingsQuizViewOne,
        builder: (context, state) => const OtherThingsQuizView()),
    GoRoute(
        path: otherThingsQuizViewTwo,
        builder: (context, state) => const ThingsQuizTwoView()),
    GoRoute(
        path: otherThingsQuizViewThree,
        builder: (context, state) => const ThingsQuizThreeView()),
    GoRoute(
        path: otherThingsQuizViewFour,
        builder: (context, state) => const ThingsQuizFourView()),
    GoRoute(
        path: otherThingsQuizViewFive,
        builder: (context, state) => const ThingsQuizFiveView()),
    GoRoute(
        path: otherThingsQuizViewSix,
        builder: (context, state) => const ThingsQuizSixView()),
    GoRoute(
        path: otherThingsQuizViewSeven,
        builder: (context, state) => const ThingsQuizSevenView()),
    GoRoute(
        path: otherThingsQuizViewEight,
        builder: (context, state) => const ThingsQuizEightView()),
    GoRoute(
        path: otherThingsQuizViewNine,
        builder: (context, state) => const ThingsQuizNineView()),
    GoRoute(
        path: otherThingsQuizViewTen,
        builder: (context, state) => const ThingsQuizTenView()),
    GoRoute(
        path: otherThingsQuizViewFinal,
        builder: (context, state) => const ThingsQuizFinalView()),
  ]);
}
