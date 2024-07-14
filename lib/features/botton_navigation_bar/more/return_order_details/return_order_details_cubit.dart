import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/orderDetailsModel.dart';
import 'package:yiki1/core/models/returnOrderDetailsModel.dart';
import 'package:yiki1/utils/utils.dart';

import 'return_order_details_state.dart';

class ReturnOrderDetailsCubit extends Cubit<ReturnOrderDetailsState> {
  ReturnOrderDetailsCubit() : super(InitialSate());
  ReturnOrderDetailsModel? returnOrderDetailsResponse;
  getDetailsOrders(id) async {
    emit(LoadingSate());
    Response? response = await DioHelper.get("show/$id/return");
    final data = response!.data;
    print(data);
    if (response.statusCode == 200) {
      returnOrderDetailsResponse = ReturnOrderDetailsModel.fromJson(data);
      emit(SuccessSate());
      print("=============${returnOrderDetailsResponse!.data!.reason.toString()}");
    } else {
      emit(ErrorSate());
      Utils.showSnackBar(data['message'] ?? "Error  Data");
    }
  }
  //:TODO RETURN REASON MODEL
  // CouponModel?couponRsponse;
  addReturnReason() async {
    final body ={
      "order":"9",
      "reason":"fklhfasfhaslfhaslfhaslfkl",
      "products":[
        {
          "id":1,  // this come in order items with key "product_id"
          "item_id":8, // this come in order items with key "id"
          "quantity":1
        }
      ]
    };
    Response response = await DioHelper.post("make/returns", true, body: body);
    final data = response.data as Map<String, dynamic>;
    print("=======${data.toString()}");

    if (data["status"] == true) {
      // couponRsponse= CouponModel.fromJson(data);
      emit(SuccessSate());
    } else {
      emit(ErrorSate());
      print(data["message"]);
      Utils.showSnackBar(data["message"] ?? "Error");
    }
  }
}
