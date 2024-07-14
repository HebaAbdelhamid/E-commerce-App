import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:yiki1/core/app_storage/app_storage.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/user_model.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/validate.dart';
import 'package:yiki1/features/botton_navigation_bar/botton_navigation_bar_view.dart';
import 'package:yiki1/features/google_map/add_new_address/components/Countries.dart';
import 'package:yiki1/utils/utils.dart';

import 'state.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitLogInState());

  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  login()async {
   if(!formKey.currentState!.validate())return ;
   emit(LoadingLogInState());
   final body={
     "email":email.text,
     "password":password.text,
     "type":"android",
     "token":"token"
   };
   Response response=await DioHelper.post("auth/login", false,body: body);
   final data =response.data as Map<String,dynamic>;
   if(data["status"]==true){
     emit(SuccessLogInState());
     final UserModel userModel = UserModel.fromJson(data);
     AppStorage.cacheUserInfo(userModel);
     MagicRouter.navigateAndPopAll(BottonNavigationBarPage());
     // MagicRouter.navigateTo(Countries());

   }else{
     emit(ErrorLogInState());
     print(data["message"]??"Error");
   }
  }
}
