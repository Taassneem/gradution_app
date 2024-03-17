part of 'global_cubit.dart';

sealed class GlobalState extends Equatable {
  const GlobalState();

  @override
  List<Object> get props => [];
}

final class GlobalInitial extends GlobalState {}

final class ChangeLanguageLoading extends GlobalState {}

final class ChangeLanguageArabic extends GlobalState {}

final class ChangeLanguageEnglish extends GlobalState {}

final class ChangeLanguageSuccess extends GlobalState {}

final class ChangeTheme extends GlobalState {}

final class GetChangeTheme extends GlobalState {}

final class GetChangeLang extends GlobalState {}

final class InitialTheme extends GlobalState {}
