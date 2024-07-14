import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/profileModel.dart';
import 'package:yiki1/utils/utils.dart';

import 'account_setting_state.dart';

class AccountSettingCubit extends Cubit<Account_settingState> {
  AccountSettingCubit() : super(InitialAccount_settingState());
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  ProfileModel? profileResponse;
  imagePicker(){
    ImagePicker().pickImage(source: ImageSource.gallery);

  }

  updateProfile() async {
    final body = {"_method": "_method", "name": name.text, "email": email.text};
    Response response = await DioHelper.put("auth/profile", true, body: body);
    final data = response.data as Map<String, dynamic>;
    if (data["status"] == true) {
      print("=======");
      profileResponse = ProfileModel.fromJson(data);
      emit(SuccessAccount_settingState());
      print(profileResponse!.data!.user!.toJson());
    } else {
      emit(ErrorAccount_settingState());
      print(data["message"]);
      Utils.showSnackBar(data["message"] ?? "Error");
    }
  }

  updatePassword() async {
    final body = {
      "_method": "_method",
      "password": password.text,
    };
    Response response =
        await DioHelper.put("auth/update-password", true, body: body);
    final data = response.data as Map<String, dynamic>;
    if (data["status"] == true) {
      print("=======");
      profileResponse = ProfileModel.fromJson(data);
      emit(SuccessAccount_settingState());
      print(profileResponse!.data!.user!.toJson());
    } else {
      emit(ErrorAccount_settingState());
      print(data["message"]);
      Utils.showSnackBar(data["message"] ?? "Error");
    }
  }
}
