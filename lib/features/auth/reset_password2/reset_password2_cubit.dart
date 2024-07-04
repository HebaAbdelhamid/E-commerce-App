
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/utils/utils.dart';

import 'reset_password2_state.dart';

class Reset_password2Cubit extends Cubit<ResetPassword2State> {
  final email;
  final pinCode;
  Reset_password2Cubit({required this.email,required this.pinCode}) : super(InitialResetPassword2State());
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  resetPassword()async{
    emit(LoadingResetPassword2State());
    final body={
      "email":email,
      "code":pinCode,
      "password":password
    };
  Response response=await  DioHelper.post("auth/forget/reset", false,body: body);
final data=response.data;
if(data["status"]==true){
  emit(SuccessResetPassword2State());
  // print(email+pinCode+password);
  print(email);
  print(pinCode);
  print(password);
  Utils.resetPassword2();

}else{
  emit(ErrorResetPassword2State());
  Utils.showSnackBar(data["message"]??"Error");
}
  }

}
