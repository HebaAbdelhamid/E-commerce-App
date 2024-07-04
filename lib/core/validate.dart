
import 'package:easy_localization/easy_localization.dart';

 class Validate{
  static String? vaidateEmail(value){
    if (value == null || value.isEmpty) {
      return 'Please enter an email'.tr();
    }
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email'.tr();
    }
    return null;
  }
  static String?validatePassword(value){
    if (value == null || value.isEmpty) {
      return 'Please enter an password'.tr();
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long'.tr();
    }
    return null;
  }static String?confirmPassword(value1,value2){
    if (value1 != value2) {
      return 'Please enter a confirm password again '.tr();
    }

    return null;
  }


}


