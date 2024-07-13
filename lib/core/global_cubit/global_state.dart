part of 'global_cubit.dart';

sealed class GlobalState extends Equatable {
  const GlobalState();

  @override
  List<Object> get props => [];
}

final class GlobalInitial extends GlobalState {}

final class ChangeLanguageLoading extends GlobalState {}

final class ChangeLanguageSuccess extends GlobalState {}

final class ChangeLanguageArabic extends GlobalState {}

final class ChangeLanguage extends GlobalState {
  final String languagecode;

  const ChangeLanguage({required this.languagecode});
}

final class GetChangeLang extends GlobalState {
  final String languagecode;

  const GetChangeLang(this.languagecode);
}
final class ChangeAdmin extends GlobalState {
  final String admincode;

  const ChangeAdmin({required this.admincode});
}

final class GetChangeAdmin extends GlobalState {
  final String admincode;

  const GetChangeAdmin(this.admincode);
}

final class ChangeLanguageEnglish extends GlobalState {}

final class ChangeTheme extends GlobalState {}

final class GetChangeTheme extends GlobalState {}

final class InitialTheme extends GlobalState {}
