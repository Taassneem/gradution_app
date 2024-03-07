// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Autism children`
  String get appName {
    return Intl.message(
      'Autism children',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Discovering things`
  String get onBoardingTitleOne {
    return Intl.message(
      'Discovering things',
      name: 'onBoardingTitleOne',
      desc: '',
      args: [],
    );
  }

  /// `When you find something you don't know you can take a picture to wonder what the thing is`
  String get onBoardingSubTitleOne {
    return Intl.message(
      'When you find something you don\'t know you can take a picture to wonder what the thing is',
      name: 'onBoardingSubTitleOne',
      desc: '',
      args: [],
    );
  }

  /// `Daily tasks`
  String get onBoardingTitleTwo {
    return Intl.message(
      'Daily tasks',
      name: 'onBoardingTitleTwo',
      desc: '',
      args: [],
    );
  }

  /// `You can upload the picture to identify its contents`
  String get onBoardingSubTitleTwo {
    return Intl.message(
      'You can upload the picture to identify its contents',
      name: 'onBoardingSubTitleTwo',
      desc: '',
      args: [],
    );
  }

  /// `Parental supervision`
  String get onBoardingTitleThree {
    return Intl.message(
      'Parental supervision',
      name: 'onBoardingTitleThree',
      desc: '',
      args: [],
    );
  }

  /// `can organize tasks and track the child's location`
  String get onBoardingSubTitleThree {
    return Intl.message(
      'can organize tasks and track the child\'s location',
      name: 'onBoardingSubTitleThree',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get onBoardingTitleFour {
    return Intl.message(
      'Welcome',
      name: 'onBoardingTitleFour',
      desc: '',
      args: [],
    );
  }

  /// `Let's Start!`
  String get onBoardingSubTitleFour {
    return Intl.message(
      'Let`s Start!',
      name: 'onBoardingSubTitleFour',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back !`
  String get signInWelcome {
    return Intl.message(
      'Welcome back !',
      name: 'signInWelcome',
      desc: '',
      args: [],
    );
  }

  /// `Welcome !`
  String get welcome {
    return Intl.message(
      'Welcome !',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account`
  String get signInSubTitle {
    return Intl.message(
      'Login to your account',
      name: 'signInSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAcc {
    return Intl.message(
      'Create Account',
      name: 'createAcc',
      desc: '',
      args: [],
    );
  }

  /// `Forget password`
  String get forgetPass {
    return Intl.message(
      'Forget password',
      name: 'forgetPass',
      desc: '',
      args: [],
    );
  }

  /// `Enter the email address associated with your account`
  String get forgetPassSubTitle {
    return Intl.message(
      'Enter the email address associated with your account',
      name: 'forgetPassSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `Please enter 4-digit code sent to you at email address`
  String get verificationSubTitle {
    return Intl.message(
      'Please enter 4-digit code sent to you at email address',
      name: 'verificationSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create new password`
  String get newPass {
    return Intl.message(
      'Create new password',
      name: 'newPass',
      desc: '',
      args: [],
    );
  }

  /// `Your new password must be different from previous used password`
  String get newPassSubTitle {
    return Intl.message(
      'Your new password must be different from previous used password',
      name: 'newPassSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Didn’t receive code?`
  String get receiveCodeAgain {
    return Intl.message(
      'Didn’t receive code?',
      name: 'receiveCodeAgain',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Change Email`
  String get changeEmail {
    return Intl.message(
      'Change Email',
      name: 'changeEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully!`
  String get changeSuccessfully {
    return Intl.message(
      'Password changed successfully!',
      name: 'changeSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Which One Are You?`
  String get choose {
    return Intl.message(
      'Which One Are You?',
      name: 'choose',
      desc: '',
      args: [],
    );
  }

  /// `Child`
  String get child {
    return Intl.message(
      'Child',
      name: 'child',
      desc: '',
      args: [],
    );
  }

  /// `Parent`
  String get parent {
    return Intl.message(
      'Parent',
      name: 'parent',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Quiz`
  String get quiz {
    return Intl.message(
      'Quiz',
      name: 'quiz',
      desc: '',
      args: [],
    );
  }

  /// `Task`
  String get task {
    return Intl.message(
      'Task',
      name: 'task',
      desc: '',
      args: [],
    );
  }

  /// `Animals`
  String get animals {
    return Intl.message(
      'Animals',
      name: 'animals',
      desc: '',
      args: [],
    );
  }

  /// `Numbers`
  String get numbers {
    return Intl.message(
      'Numbers',
      name: 'numbers',
      desc: '',
      args: [],
    );
  }

  /// `Food and Drink`
  String get foodAndDrink {
    return Intl.message(
      'Food and Drink',
      name: 'foodAndDrink',
      desc: '',
      args: [],
    );
  }

  /// `Other Things`
  String get otherThings {
    return Intl.message(
      'Other Things',
      name: 'otherThings',
      desc: '',
      args: [],
    );
  }

  /// `Ooops!`
  String get oops {
    return Intl.message(
      'Ooops!',
      name: 'oops',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message(
      'Try Again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue1 {
    return Intl.message(
      'Continue',
      name: 'continue1',
      desc: '',
      args: [],
    );
  }

  /// `The Answer is Wrong ,Please Try Again`
  String get errorMessage {
    return Intl.message(
      'The Answer is Wrong ,Please Try Again',
      name: 'errorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations! The Answer is Correct`
  String get correct {
    return Intl.message(
      'Congratulations! The Answer is Correct',
      name: 'correct',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations!`
  String get congratulations {
    return Intl.message(
      'Congratulations!',
      name: 'congratulations',
      desc: '',
      args: [],
    );
  }

  /// `You Are finished Food And Drink Quiz`
  String get congratulationsSubTitle {
    return Intl.message(
      'You Are finished Food And Drink Quiz',
      name: 'congratulationsSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `The Ship`
  String get theShip {
    return Intl.message(
      'The Ship',
      name: 'theShip',
      desc: '',
      args: [],
    );
  }

  /// `Pants`
  String get pants {
    return Intl.message(
      'Pants',
      name: 'pants',
      desc: '',
      args: [],
    );
  }

  /// `Circle`
  String get circle {
    return Intl.message(
      'Circle',
      name: 'circle',
      desc: '',
      args: [],
    );
  }

  /// `Star`
  String get star {
    return Intl.message(
      'Star',
      name: 'star',
      desc: '',
      args: [],
    );
  }

  /// `Triangle`
  String get triangle {
    return Intl.message(
      'Triangle',
      name: 'triangle',
      desc: '',
      args: [],
    );
  }

  /// `Rectangle`
  String get rectangle {
    return Intl.message(
      'Rectangle',
      name: 'rectangle',
      desc: '',
      args: [],
    );
  }

  /// `Door`
  String get door {
    return Intl.message(
      'Door',
      name: 'door',
      desc: '',
      args: [],
    );
  }

  /// `Office`
  String get office {
    return Intl.message(
      'Office',
      name: 'office',
      desc: '',
      args: [],
    );
  }

  /// `Bed`
  String get bed {
    return Intl.message(
      'Bed',
      name: 'bed',
      desc: '',
      args: [],
    );
  }

  /// `Window`
  String get window {
    return Intl.message(
      'Window',
      name: 'window',
      desc: '',
      args: [],
    );
  }

  /// `The Eraser`
  String get theEraser {
    return Intl.message(
      'The Eraser',
      name: 'theEraser',
      desc: '',
      args: [],
    );
  }

  /// `Hand`
  String get hand {
    return Intl.message(
      'Hand',
      name: 'hand',
      desc: '',
      args: [],
    );
  }

  /// `Windy`
  String get windy {
    return Intl.message(
      'Windy',
      name: 'windy',
      desc: '',
      args: [],
    );
  }

  /// `Cloudy`
  String get cloudy {
    return Intl.message(
      'Cloudy',
      name: 'cloudy',
      desc: '',
      args: [],
    );
  }

  /// `Sunny`
  String get sunny {
    return Intl.message(
      'Sunny',
      name: 'sunny',
      desc: '',
      args: [],
    );
  }

  /// `Snow`
  String get snow {
    return Intl.message(
      'Snow',
      name: 'snow',
      desc: '',
      args: [],
    );
  }

  /// `Sad`
  String get sad {
    return Intl.message(
      'Sad',
      name: 'sad',
      desc: '',
      args: [],
    );
  }

  /// `Watch`
  String get watch {
    return Intl.message(
      'Watch',
      name: 'watch',
      desc: '',
      args: [],
    );
  }

  /// `Father`
  String get father {
    return Intl.message(
      'Father',
      name: 'father',
      desc: '',
      args: [],
    );
  }

  /// `Camel`
  String get camel {
    return Intl.message(
      'Camel',
      name: 'camel',
      desc: '',
      args: [],
    );
  }

  /// `Dog`
  String get dog {
    return Intl.message(
      'Dog',
      name: 'dog',
      desc: '',
      args: [],
    );
  }

  /// `Cat`
  String get cat {
    return Intl.message(
      'Cat',
      name: 'cat',
      desc: '',
      args: [],
    );
  }

  /// `Lion`
  String get lion {
    return Intl.message(
      'Lion',
      name: 'lion',
      desc: '',
      args: [],
    );
  }

  /// `Snake`
  String get snake {
    return Intl.message(
      'Snake',
      name: 'snake',
      desc: '',
      args: [],
    );
  }

  /// `Elephant`
  String get elephant {
    return Intl.message(
      'Elephant',
      name: 'elephant',
      desc: '',
      args: [],
    );
  }

  /// `Emu`
  String get emu {
    return Intl.message(
      'Emu',
      name: 'emu',
      desc: '',
      args: [],
    );
  }

  /// `Bear`
  String get bear {
    return Intl.message(
      'Bear',
      name: 'bear',
      desc: '',
      args: [],
    );
  }

  /// `Monkey`
  String get monkey {
    return Intl.message(
      'Monkey',
      name: 'monkey',
      desc: '',
      args: [],
    );
  }

  /// `Fox`
  String get fox {
    return Intl.message(
      'Fox',
      name: 'fox',
      desc: '',
      args: [],
    );
  }

  /// `Lemure`
  String get lemure {
    return Intl.message(
      'Lemure',
      name: 'lemure',
      desc: '',
      args: [],
    );
  }

  /// `Cow`
  String get cow {
    return Intl.message(
      'Cow',
      name: 'cow',
      desc: '',
      args: [],
    );
  }

  /// `Cake`
  String get cake {
    return Intl.message(
      'Cake',
      name: 'cake',
      desc: '',
      args: [],
    );
  }

  /// `Chicken`
  String get chicken {
    return Intl.message(
      'Chicken',
      name: 'chicken',
      desc: '',
      args: [],
    );
  }

  /// `Meat`
  String get meat {
    return Intl.message(
      'Meat',
      name: 'meat',
      desc: '',
      args: [],
    );
  }

  /// `Egg`
  String get egg {
    return Intl.message(
      'Egg',
      name: 'egg',
      desc: '',
      args: [],
    );
  }

  /// `Salmon`
  String get salmon {
    return Intl.message(
      'Salmon',
      name: 'salmon',
      desc: '',
      args: [],
    );
  }

  /// `Milk`
  String get milk {
    return Intl.message(
      'Milk',
      name: 'milk',
      desc: '',
      args: [],
    );
  }

  /// `Water`
  String get water {
    return Intl.message(
      'Water',
      name: 'water',
      desc: '',
      args: [],
    );
  }

  /// `Tea`
  String get tea {
    return Intl.message(
      'Tea',
      name: 'tea',
      desc: '',
      args: [],
    );
  }

  /// `Coffee`
  String get coffee {
    return Intl.message(
      'Coffee',
      name: 'coffee',
      desc: '',
      args: [],
    );
  }

  /// `Eggplant`
  String get eggplant {
    return Intl.message(
      'Eggplant',
      name: 'eggplant',
      desc: '',
      args: [],
    );
  }

  /// `Cebola`
  String get cebola {
    return Intl.message(
      'Cebola',
      name: 'cebola',
      desc: '',
      args: [],
    );
  }

  /// `Pepper`
  String get pepper {
    return Intl.message(
      'Pepper',
      name: 'pepper',
      desc: '',
      args: [],
    );
  }

  /// `Potato`
  String get potato {
    return Intl.message(
      'Potato',
      name: 'potato',
      desc: '',
      args: [],
    );
  }

  /// `Fish`
  String get fish {
    return Intl.message(
      'Fish',
      name: 'fish',
      desc: '',
      args: [],
    );
  }

  /// `Pumpkin`
  String get pumpkin {
    return Intl.message(
      'Pumpkin',
      name: 'pumpkin',
      desc: '',
      args: [],
    );
  }

  /// `Grapes`
  String get grapes {
    return Intl.message(
      'Grapes',
      name: 'grapes',
      desc: '',
      args: [],
    );
  }

  /// `Strawberry`
  String get strawberry {
    return Intl.message(
      'Strawberry',
      name: 'strawberry',
      desc: '',
      args: [],
    );
  }

  /// `Cherries`
  String get cherries {
    return Intl.message(
      'Cherries',
      name: 'cherries',
      desc: '',
      args: [],
    );
  }

  /// `Juice`
  String get juice {
    return Intl.message(
      'Juice',
      name: 'juice',
      desc: '',
      args: [],
    );
  }

  /// `Orange`
  String get orange {
    return Intl.message(
      'Orange',
      name: 'orange',
      desc: '',
      args: [],
    );
  }

  /// `Carrot`
  String get carrot {
    return Intl.message(
      'Carrot',
      name: 'carrot',
      desc: '',
      args: [],
    );
  }

  /// `Cucumber`
  String get cucumber {
    return Intl.message(
      'Cucumber',
      name: 'cucumber',
      desc: '',
      args: [],
    );
  }

  /// `Tomato`
  String get tomato {
    return Intl.message(
      'Tomato',
      name: 'tomato',
      desc: '',
      args: [],
    );
  }

  /// `Corn`
  String get corn {
    return Intl.message(
      'Corn',
      name: 'corn',
      desc: '',
      args: [],
    );
  }

  /// `How many animals are in the picture?`
  String get howManyAnimalsInPicture {
    return Intl.message(
      'How many animals are in the picture?',
      name: 'howManyAnimalsInPicture',
      desc: '',
      args: [],
    );
  }

  /// `What is the name of this number?`
  String get nameOfNumber {
    return Intl.message(
      'What is the name of this number?',
      name: 'nameOfNumber',
      desc: '',
      args: [],
    );
  }

  /// `Which of them means number Seven?`
  String get meaningOfSeven {
    return Intl.message(
      'Which of them means number Seven?',
      name: 'meaningOfSeven',
      desc: '',
      args: [],
    );
  }

  /// `Which of These is 'the camel'?`
  String get theCamel {
    return Intl.message(
      'Which of These is \'the camel\'?',
      name: 'theCamel',
      desc: '',
      args: [],
    );
  }

  /// `Which of These is 'the Dog'?`
  String get theDog {
    return Intl.message(
      'Which of These is \'the Dog\'?',
      name: 'theDog',
      desc: '',
      args: [],
    );
  }

  /// `Which of These is 'the Cat'?`
  String get theCat {
    return Intl.message(
      'Which of These is \'the Cat\'?',
      name: 'theCat',
      desc: '',
      args: [],
    );
  }

  /// `Which of These is 'the Lion'?`
  String get theLion {
    return Intl.message(
      'Which of These is \'the Lion\'?',
      name: 'theLion',
      desc: '',
      args: [],
    );
  }

  /// `Which of These is 'the Snake'?`
  String get theSnake {
    return Intl.message(
      'Which of These is \'the Snake\'?',
      name: 'theSnake',
      desc: '',
      args: [],
    );
  }

  /// `Six`
  String get six {
    return Intl.message(
      'Six',
      name: 'six',
      desc: '',
      args: [],
    );
  }

  /// `Seven`
  String get seven {
    return Intl.message(
      'Seven',
      name: 'seven',
      desc: '',
      args: [],
    );
  }

  /// `Nine`
  String get nine {
    return Intl.message(
      'Nine',
      name: 'nine',
      desc: '',
      args: [],
    );
  }

  /// `Ten`
  String get ten {
    return Intl.message(
      'Ten',
      name: 'ten',
      desc: '',
      args: [],
    );
  }

  /// `Five`
  String get five {
    return Intl.message(
      'Five',
      name: 'five',
      desc: '',
      args: [],
    );
  }

  /// `Turtle`
  String get turtle {
    return Intl.message(
      'Turtle',
      name: 'turtle',
      desc: '',
      args: [],
    );
  }

  /// `6 + 5 =`
  String get sum {
    return Intl.message(
      '6 + 5 =',
      name: 'sum',
      desc: '',
      args: [],
    );
  }

  /// `15 - 6 =`
  String get sub {
    return Intl.message(
      '15 - 6 =',
      name: 'sub',
      desc: '',
      args: [],
    );
  }

  /// `4 - f _  _ r`
  String get four {
    return Intl.message(
      '4 - f _  _ r',
      name: 'four',
      desc: '',
      args: [],
    );
  }

  /// `2 * 7=`
  String get multi {
    return Intl.message(
      '2 * 7=',
      name: 'multi',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
