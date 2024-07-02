import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yiki1/core/validate.dart';

import 'state.dart';

class SignupCubit extends Cubit<SignUpSate> {
  SignupCubit() : super(InitialState());
  final formKey=GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  bool checkedValue=false;

  checked(checked){
    checkedValue=checked;
    emit(CheckeState());

  }
  signUp() {
    String? emailError = Validate.vaidateEmail(email.text);
    String? passwordError = Validate.validatePassword(password.text);
    String? confirmpasswordError = Validate.confirmPassword(password.text,confirmpassword.text);

    if (emailError!=null) {
      print(emailError);
      emit(ErrorSignUpState ('error in email'));
      return emailError.toString();
    } else if (passwordError!=null) {
      print(passwordError);
      emit(ErrorSignUpState ('error in password'));
      return passwordError.toString();

    }
   else if(confirmpasswordError!=null){
      print(confirmpasswordError);
      emit(ErrorSignUpState ('error in password'));
     return confirmpasswordError.toString();
    }
    else {
      print("Email and password are valid. Proceeding with login...");
      emit(SuccessSignUpState());
      return "Successfully Log in";
    }

  }
}

