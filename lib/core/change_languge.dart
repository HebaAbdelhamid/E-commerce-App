import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationChecker {
  static changeLanguge(BuildContext context,Locale locale) {
    // Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
    // if (currentLocal == const Locale("en", '')) {
      EasyLocalization.of(context)!.setLocale(locale);
    // } else {
    //   EasyLocalization.of(context)!.setLocale(const Locale('en', ''));
    // }
  }
}