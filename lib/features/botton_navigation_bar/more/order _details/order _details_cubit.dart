import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/orderDetailsModel.dart';
import 'package:yiki1/core/models/orderModel.dart';
import 'package:yiki1/core/models/rateModel.dart';
import 'package:yiki1/utils/utils.dart';

import 'order _details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(InitialSate());
  TextEditingController text=TextEditingController();
  OrderDetailsModel? orderDetailsResponse;
  getDetailsOrders(id) async {
    emit(LoadingSate());
    Response? response = await DioHelper.get("show/$id/order");
    final data = response!.data;
    print(data);
    if (response.statusCode == 200) {
      orderDetailsResponse = OrderDetailsModel.fromJson(data);
      emit(SuccessSate());
    } else {
      emit(ErrorSate());
      Utils.showSnackBar(data['message'] ?? "Error  Data");
    }
  }
  RateModel?rateResponse;
  addRate(id,value) async {
    final body ={
      "value":value.toString(),
      "message":text
    };
    Response response = await DioHelper.post("order/$id/rate", true, body: body);
    final data = response.data as Map<String, dynamic>;
    print("=======${data.toString()}");

    if (data["status"] == true) {
      rateResponse= RateModel.fromJson(data);
      emit(SuccessSate());
    } else {
      emit(ErrorSate());
      print(data["message"]);
      Utils.showSnackBar(data["message"] ?? "Error");
    }
  }
  OrderModel? orderResponse;
  postCancelOrders(id) async {
    final body = {"reason": "ff t tew tewt ewt wetwet"};
    emit(LoadingSate());
    Response? response =
    await DioHelper.post("order/$id/cancel", true, body: body);
    final data = response!.data;
    print(data);
    if (data["status"] == 200) {
      orderResponse = OrderModel.fromJson(data);
      print(orderResponse!.data.toString());
      emit(SuccessSate());
    } else {
      emit(ErrorSate());
      print(data["message"]);
      // Utils.showSnackBar(data['message'] ?? "Error  Data");
    }
  }


}
