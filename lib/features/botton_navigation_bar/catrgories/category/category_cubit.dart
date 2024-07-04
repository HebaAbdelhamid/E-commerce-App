import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/addToCartModel.dart';
import 'package:yiki1/utils/utils.dart';

import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(InitialCategoryState());
  AddtoCartModel?addtoCartResponse;

  void selected(value){
    value=true;
  }
  addToCart()async{
    final body={
      "id":"1",
      "quantity":"4",
      "all_quantity":"1"
    };
    Response response=await  DioHelper.post("add-to-cart", true,body: body);
    final data=response.data as Map<String,dynamic>;
    print("=======");

    if(data["status"]==true){
      print("=======");
      emit(SuccessCategoryState());
      addtoCartResponse=AddtoCartModel.fromJson(data);
      print(data.toString());
    }else{
      emit(ErrorCategoryState());
      Utils.showSnackBar(data["message"]??"Error");
    }
  }

}
