import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/features/auth/pin_code/pincode_view2.dart';
import 'package:yiki1/features/auth/reset_password2/reset_password2_view.dart';
import 'package:yiki1/utils/utils.dart';

import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(InitialResetPasswordState());
  TextEditingController email = TextEditingController();

  reetPassword() async {
    emit(LoadingResetPasswordState());
    final body = {"email": email.text};

    Response response = await DioHelper.post("auth/forget", false, body: body);
    final data = response.data;
    if (data["status"] == true) {
      emit(SuccessResetPasswordState());
      print("emailemailemail ${email.text}");
      MagicRouter.navigateTo(Pincode2Page(email.text));
    } else {
      emit(ErrorResetPasswordState());
      Utils.showSnackBar(data["message"] ?? "Error");
    }
  }
}
