import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/orderDetailsModel.dart';
import 'package:yiki1/core/models/postReturnOrderModel.dart';
import 'package:yiki1/utils/utils.dart';

import 'return_order_reason_state.dart';

class ReturnOrderReasonCubit extends Cubit<ReturnOrderReasonState> {
  ReturnOrderReasonCubit() : super(IntialState());
  TextEditingController reason =TextEditingController();
  Map<int, int> itemCounts = {};

  increament(int itemId ) {
    itemCounts[itemId] = (itemCounts[itemId] ?? 0) + 1;
    emit(SelectedState());
  }

  decreament(int itemId) {
    itemCounts[itemId] = itemCounts[itemId]! - 1;
    emit(SelectedState());
  }
  int getItemCount(int itemId) {
    return itemCounts[itemId] ?? 1;
  }
  // AddtoCartModel? addtoCartResponse;
  PostReturnOrderModel?postReturnOrderResponse;
  addReturnOrder({ idOrder,idProduct,idItem,quantity}) async {
    final body =
    {"order":idOrder,
      "reason":reason.text,
      "products":[
        {
          "id":idProduct,  // this come in order items with key "product_id"
          "item_id":idItem, // this come in order items with key "id"
          "quantity":quantity
        }
      ]
    };
    Response response = await DioHelper.post("make/returns", true, body: body);
    print(response.toString());
    final data = response.data as Map<String, dynamic>;
    if (data["status"] == true) {
      print("=======");
      postReturnOrderResponse=PostReturnOrderModel.fromJson(data);
      // addtoCartResponse = AddtoCartModel.fromJson(data);
      // print(addtoCartResponse!.data!.order!.items![0].productName);
      // print(addtoCartResponse!.data!.order!.items!.length);

      emit(SuccessState());
    } else {
      emit(ErrorState());
      // Utils.showSnackBar(data["message"] ?? "Error");
    }
  }
  OrderDetailsModel? orderDetailsResponse;
  getDetailsOrders(id) async {
    emit(LoadingState());
    Response? response = await DioHelper.get("show/$id/order");
    final data = response!.data;
    print(data);
    if (response.statusCode == 200) {
      orderDetailsResponse = OrderDetailsModel.fromJson(data);
      emit(SuccessState());
    } else {
      emit(ErrorState());
      Utils.showSnackBar(data['message'] ?? "Error  Data");
    }
  }
}
