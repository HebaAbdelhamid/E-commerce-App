import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/contactUsModel.dart';
import 'package:yiki1/utils/utils.dart';
import 'contact_as_state.dart';

class Contact_asCubit extends Cubit<Contact_asState> {
  Contact_asCubit() : super(InitialState());
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController message=TextEditingController();

  ContactUsModel?contactUsResponse;
  addContactUsMethods() async {
    final body ={
      "name":name,
      "phone":"01091043660",
      "email":email.text,
      "message":message

    };
    Response response = await DioHelper.post("contacts", true, body: body);
    final data = response.data as Map<String, dynamic>;
    print("=======${data.toString()}");

    if (data["status"] == true) {
      contactUsResponse= ContactUsModel.fromJson(data);
      emit(SuccessState());
    } else {
      emit(ErrorState());
      print(data["message"]);
      Utils.showSnackBar(data["message"] ?? "Error");
    }
  }
}
