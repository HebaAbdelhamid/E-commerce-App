import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/notificationModel.dart';
import 'package:yiki1/utils/utils.dart';

import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(InitialState());
  NotificationModel?notificationRespone;
  fetchNotification()async{
    Response? resopnse=await DioHelper.get("notifications");
    final data=resopnse!.data as Map<String,dynamic>;
    if(data["status"]==true){
      emit(LoadingState());
      notificationRespone=NotificationModel.fromJson(data);
      print(notificationRespone!.data.toString());
      emit(SuccessState());
    }
    else{
      emit(ErrorState());
      Utils.showSnackBar(data["msssage"]??"Error");
    }
  }
}
