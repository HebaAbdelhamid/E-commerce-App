import 'package:bloc/bloc.dart';
import 'package:yiki1/core/validate.dart';
import 'package:yiki1/utils/utils.dart';

import 'state.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(initState());

  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // login() {
  //   String? emailError = Validate.vaidateEmail(email.text);
  //   String? passwordError = Validate.validatePassword(password.text);
  //   if (emailError != null) {
  //     print(emailError);
  //     emit(ErrorLogInState());
  //     return emailError.toString();
  //   } else if (passwordError != null) {
  //     print(passwordError);
  //     emit(ErrorLogInState());
  //     return passwordError.toString();
  //   } else {
  //     print("Email and password are valid. Proceeding with login...");
  //     emit(SuccessLogInState());
  //     return "Successfully Log in";
  //   }
  // }
}
