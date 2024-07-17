import 'package:bloc/bloc.dart';
import 'package:yiki1/core/app_storage/app_storage.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';

import 'sign_out_state.dart';

class Sign_outCubit extends Cubit<Sign_outState> {
  Sign_outCubit() : super(Sign_outState().init());
  signOut(){
    AppStorage.clearUserInfo();
  }
}
