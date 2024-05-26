import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/core/utils/api_keys.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';
import 'package:gradution_app/features/task/data/models/task_model/task_model.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());
  TaskModel? taskModel;
  String langCode = "en";

  void toggleLanguage(String language) {
    langCode = language;
    log('Language code saved: $langCode');

    getIt<CacheHelper>()
        .saveData(key: CacheHelperKey.languageCode, value: langCode);
    emit(ChangeLanguage(languagecode: langCode));
  }

  void getLang() {
    String? langCodeFromCache =
        getIt<CacheHelper>().getData(key: CacheHelperKey.languageCode);
    if (langCodeFromCache != null) {
      langCode = langCodeFromCache;
    }
    log('Language code retrieved: $langCode');
    emit(GetChangeLang(langCode));
  }

  // String langCode = "en";
  // bool isArabic = false;
  // void arabic() {
  //   isArabic = !isArabic;
  //   langCode = 'ar';
  //   log('Language code saved: isArabic $langCode');

  //   getIt<CacheHelper>()
  //       .saveData(key: CacheHelperKey.isArabic, value: isArabic ? 'ar' : 'en');
  //   emit(ChangeLanguageArabic());
  // }

  // bool isEnglish = false;
  // void english() {
  //   isEnglish = !isEnglish;
  //   langCode = 'en';
  //   log('Language code saved: isEnglish $langCode');

  //   getIt<CacheHelper>().saveData(
  //       key: CacheHelperKey.isEnglish, value: isEnglish ? 'en' : 'ar');
  //   emit(ChangeLanguageEnglish());
  // }

  // void getLang() {
  //   String? langCodeFromCache =
  //       getIt<CacheHelper>().getData(key: CacheHelperKey.isArabic);
  //   isArabic = langCodeFromCache == 'en';
  //   langCode = isArabic ? 'ar' : 'en';
  //   log('Language code saved: $langCode');
  //   emit(GetChangeLang());
  // }

  // bool changeLan = false;
  // void changeLang() async {
  //   emit(ChangeLanguageLoading());

  //   changeLan = !changeLan;

  //   langCode = changeLan ? 'en' : 'ar';
  //   await getIt<CacheHelper>().saveData(
  //       key: CacheHelperKey.changeLan, value: changeLan ? 'ar' : 'en');
  //   log('Language code saved: changeLan $langCode');

  //   emit(ChangeLanguageSuccess());
  // }

  // void getChangedLang() {
  //   String? changLangCodeFromCache =
  //       getIt<CacheHelper>().getData(key: CacheHelperKey.changeLan);
  //   changeLan = changLangCodeFromCache == 'en';
  //   langCode = changeLan ? 'en' : 'ar';
  //   log('Language code saved: getChangedLang $langCode');

  //   emit(GetChangeLang());
  // }
}
