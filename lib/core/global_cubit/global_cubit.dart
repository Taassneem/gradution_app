import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/core/utils/api_keys.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  // bool darkTheme = false;
  // void changeTheme() async {
  //   emit(InitialTheme());
  //   darkTheme = !darkTheme;
  //   await getIt<CacheHelper>().saveData(key: 'isDarkTheme', value: darkTheme);
  //   emit(ChangeTheme());
  // }

  // void getThemeData() async {
  //   darkTheme = await getIt<CacheHelper>().getData(key: 'isDarkTheme');

  //   emit(GetChangeTheme());
  // }

  // bool isArabic = false;

  // void changeLang() async {
  //   emit(ChangeLanguageLoading());

  //   isArabic = !isArabic;

  //   langCode = isArabic ? 'en' : 'ar';
  //   await getIt<CacheHelper>()
  //       .saveData(key: 'isArabic', value: isArabic ? 'ar' : 'en');

  //   emit(ChangeLanguageSuccess());
  // }

  String langCode = "en";
  bool isArabic = false;
  void arabic() {
    isArabic = !isArabic;
    langCode = 'ar';
    getIt<CacheHelper>()
        .saveData(key: CacheHelperKey.isArabic, value: isArabic ? 'en' : 'ar');
    emit(ChangeLanguageArabic());
  }

  bool isEnglish = false;
  void english() {
    isEnglish = !isEnglish;
    langCode = 'en';
    getIt<CacheHelper>().saveData(
        key: CacheHelperKey.isEnglish, value: isEnglish ? 'ar' : 'en');
    emit(ChangeLanguageEnglish());
  }

  void getLang() {
    String? langCodeFromCache =
        getIt<CacheHelper>().getData(key: CacheHelperKey.isArabic);
    isArabic = langCodeFromCache == 'en';
    langCode = isArabic ? 'ar' : 'en';
    emit(GetChangeLang());
  }
}
