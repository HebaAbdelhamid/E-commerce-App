import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yiki1/core/app_storage/app_storage.dart';

import 'app_language_state.dart';

class AppLanguageCubit extends Cubit<AppLanguageState> {
  AppLanguageCubit() : super(InitialState());
  int? selected = 1;

  selesctedPayment(int index) {
    selected = index;
    emit(SelectedLanguage());
  }

  changeLanguge(BuildContext context, Locale locale) {
    // Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
    // if (currentLocal == const Locale("en", '')) {
    EasyLocalization.of(context)!.setLocale(locale);

    AppStorage.cacheLanguage(
      locale == Locale('en') ? 'english' : 'arabic',
    );
    // } else {
    //   EasyLocalization.of(context)!.setLocale(const Locale('en', ''));
    // }
  }
}
