import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/features/auth/pin_code/pincode_state.dart';
import 'package:yiki1/features/auth/reset_password2/reset_password2_view.dart';
import 'package:yiki1/features/botton_navigation_bar/botton_navigation_bar_view.dart';
import 'package:yiki1/utils/utils.dart';

class PinCodeCubit extends Cubit<PinCodeState> {
  final String? email;

  PinCodeCubit({this.email}) : super(PinCodeInitialState());
  TextEditingController pinCode = TextEditingController();
  TextEditingController pinCode2 = TextEditingController();

  sendPinCode() async {
    emit(PinCodeLoadingState());
    print(pinCode.text);
    final body = {"verification_code": pinCode.text};
    Response response = await DioHelper.post(
      "auth/verify",
      true,
      body: body,
    );
    final data = response.data as Map<String, dynamic>;
    if (data["status"] == true) {
      emit(PinCodeSuccessState());
      MagicRouter.navigateTo(BottonNavigationBarPage());
    } else {
      emit(PinCodeErrorState());
      Utils.showSnackBar(data['message'] ?? "Error ");
    }
  }

  sendPinCode2() async {
    print("email here cubit ${email}");
    emit(PinCodeLoadingState());
    print(pinCode.text);
    final body = {"email": email, "code": pinCode2.text};
    Response response = await DioHelper.post(
      "auth/forget/check",
      true,
      body: body,
    );
    final data = response.data as Map<String, dynamic>;
    if (data["status"] == true) {
      emit(PinCodeSuccessState());
      MagicRouter.navigateTo(ResetPassword2Page(email!,pinCode2.text ));
    } else {
      emit(PinCodeErrorState());
      Utils.showSnackBar(data['message'] ?? "Error ");
    }
  }
}
