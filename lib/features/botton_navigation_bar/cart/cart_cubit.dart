import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/getCart.dart';
import 'package:yiki1/utils/utils.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(InitialCartState());
  int count = 1;

  increament() {
    count = count + 1;
    emit(SelectedState());
  }

  decreament() {
    count = count - 1;
    emit(SelectedState());
  }
  GetCartModel?getCartResponse;
  fetchCartItems()async{
    emit(LoadingCartState());
   Response? response=await DioHelper.get("get-cart");
   final data=response!.data as Map<String,dynamic>;
   print('data["status"] ${data["status"]}');
   if(data["status"] == true){
     emit(SuccessCartState());
     getCartResponse=GetCartModel.fromJson(data);
     print('getCartResponse ${getCartResponse?.toJson()}');
   }else {
     print('status not true');
     emit(ErrorCartState());
     Utils.showSnackBar(data['message'] ?? "Error  Data");
   }
  }
}
