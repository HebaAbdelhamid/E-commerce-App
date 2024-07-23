import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:yiki1/core/app_storage/app_storage.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';

import 'sign_out_state.dart';

class Sign_outCubit extends Cubit<Sign_outState> {
  Sign_outCubit() : super(Sign_outState().init());

  signOut() async {
    AppStorage.clearUserInfo();

//       final body =
//       {"email":,
//         "password":reason.text,
//         "device_id":"1"
//       };
//       Response response = await DioHelper.post("auth/logout", true, body: body);
//       print(response.toString());
//       final data = response.data as Map<String, dynamic>;
//       if (data["status"] == true) {
// AppStorage.getUserData!.email;
// AppStorage.getUserInfo.
//
//         emit(SuccessState());
//       } else {
//         emit(ErrorState());
//         // Utils.showSnackBar(data["message"] ?? "Error");
//       }
//     }
  }
}
