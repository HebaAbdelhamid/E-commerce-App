import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yiki1/core/app_storage/app_storage.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/user_model.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/validate.dart';
import 'package:yiki1/features/auth/pin_code/pincode_view.dart';
import 'package:yiki1/utils/utils.dart';

import 'state.dart';

class SignupCubit extends Cubit<SignUpSate> {
  SignupCubit() : super(InitialState());
  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String phoneCode = 'eg';

  bool checkedValue = false;

  checked(checked) {
    checkedValue = checked;
    emit(CheckeState());
  }

  signUp() async {
    print('phone.text ${phone.text}');
    if (!formKey.currentState!.validate()) return;
    emit(SignupLoading());
    final body = {
      "name": name.text,
      "phone": phone.text,
      "email": email.text,
      "password": password.text,
      "token": "token",
      "user_type": "CLIENT",
      "type" : 'android',
      "phonecode": phoneCode,
    };
      DioHelper.post('auth/register', false, body: body).then((response){
        final data = response.data as Map<String, dynamic>;
        if (data['status'] == true) {
          UserModel userModel = UserModel.fromJson(data);
          AppStorage.cacheUserInfo(userModel);
          print(userModel.data!.user!.email);
          emit(SignupSuccess());
          print(userModel.data!.user!.email);

          MagicRouter.navigateTo(const PincodePage());
        } else {
          emit(SignupError());
          Utils.showSnackBar(data['message'] ?? "Error Login Data");
        }
      });

  }
}
