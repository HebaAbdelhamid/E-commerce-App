import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/categoryModel.dart';
import 'package:yiki1/utils/utils.dart';

import 'catrgories_state.dart';

class CatrgoriesCubit extends Cubit<CatrgoriesState> {
  CatrgoriesCubit() : super(InitialCatrgoriesState());
  var startAnimation=false;
  animation() {
    startAnimation = true;
  }
  CategoryModel ?categoryResponse;
  fetchCategory()async{
    emit(LoadingCatrgoriesState());
    Response? response=await DioHelper.get("categories");
    final data=response!.data as Map<String,dynamic>;
    if(data["status"]==true){
      categoryResponse=CategoryModel.fromJson(data);
      print("===========tttttttttt${categoryResponse!.data!.items![0].id}");
      emit(SuccessCatrgoriesState());

    }else{
      emit(ErrorCatrgoriesState());
      print(data["message"]??"Error");
      Utils.showSnackBar(data['message'] ?? "Error  Data");

    }
  }

}
