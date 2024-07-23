import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/deleteCartIem.dart';
import 'package:yiki1/core/models/cart_model/cart_model.dart';
import 'package:yiki1/utils/utils.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(InitialCartState());
  TextEditingController gift = TextEditingController();
  Map<int, int> itemCounts = {};
  var count;
getCount(index){
  count=getCartResponse!.data!.order!
      .items![index].quantity;
  emit(SelectedState());
  return count
      ;

}
decrementCount( index){
  getCartResponse!.data!.order!.items![index].quantity
  = (getCartResponse!.data!.order!.items![index].quantity ??1)-1
  ;

  emit(SelectedState());
}
increamentCount(index){
  getCartResponse!.data!.order!.items![index].quantity
  = (getCartResponse!.data!.order!.items![index].quantity??1 )+1
  ;
  emit(SelectedState());

}
  increament(int itemId ) {
    itemCounts[itemId] = (itemCounts[itemId] ?? 0) + 1;
    emit(SelectedState());
  }

  decreament(int itemId) {
    itemCounts[itemId] = itemCounts[itemId]! - 1;
    emit(SelectedState());
  }
  int? getItemCount(int item) {
    return itemCounts[item] ??
       1;
  }
  CartModel?getCartResponse;
  fetchCartItems()async{
    emit(LoadingCartState());
   Response? response=await DioHelper.get("get-cart");
   final data=response!.data as Map<String,dynamic>;
   print('tttttttttttdata["status"] ${data["status"]}');
   if(data["status"] == true){
     emit(SuccessCartState());
     getCartResponse=CartModel.fromJson(data);
     print('eeeeegetCartResponse ${getCartResponse?.toJson()}');
   }else {
     print('status not true');
     emit(ErrorCartState());
     Utils.showSnackBar(data['message'] ?? "Error  Data");
   }
  }
  DeleteCartIemModel?deleteCartIemResponse;
  deleteCartItems(int id)async{
    final body={
      "id": id
    };
    //delet-from-cart
    emit(LoadingCartState());
    Response? response=await DioHelper.post("delet-from-cart",true,body: body);
    final data=response.data as Map<String,dynamic>;
    if(data==null){
      emit(EmptyState());
    }
    print('data["status"] ${data["status"]}');
    if(data["status"] == true){
      emit(SuccessCartState());
      deleteCartIemResponse=DeleteCartIemModel.fromJson(data);
      print('deleteCartIemResponse ${deleteCartIemResponse?.toJson()}');
    }else {
      print('status not true');
      emit(ErrorCartState());
      Utils.showSnackBar(data['message'] ?? "Error  Data");
    }
  }




}
