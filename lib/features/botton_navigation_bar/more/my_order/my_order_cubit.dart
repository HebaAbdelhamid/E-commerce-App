import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/orderModel.dart';
import 'package:yiki1/core/models/rateModel.dart';
import 'package:yiki1/utils/utils.dart';

import 'my_order_state.dart';

class MyOrderCubit extends Cubit<MyOrderState> {
  MyOrderCubit() : super(InitialState());
  int selected = 1;
  TextEditingController text = TextEditingController();

  selected_(int index) {
    selected = index;
    emit(SelectedState());
  }

  RateModel? rateResponse;

  addRate(id, value) async {
    final body = {"value": value.toString(), "message": text};
    Response response =
        await DioHelper.post("order/$id/rate", true, body: body);
    final data = response.data as Map<String, dynamic>;
    print("=======${data.toString()}");

    if (data["status"] == true) {
      rateResponse = RateModel.fromJson(data);
      emit(SuccessState());
    } else {
      emit(SuccessState());
      print(data["message"]);
      Utils.showSnackBar(data["message"] ?? "Error");
    }
  }

  OrderModel? orderResponse;
  OrderModel? pastorderResponse;

  getCurrentOrders({status}) async {
    print("status $status");
    emit(LoadingState());
    var page = 1;
    Response? response =
        await DioHelper.get("orders?status=$status&page=$page");
    final data = response!.data;
    print(data);
    if (response.statusCode == 200) {
      orderResponse = OrderModel.fromJson(data);
      print(orderResponse!.data!.items.toString());
      emit(SuccessState());
    } else {
      emit(ErrorState());
      Utils.showSnackBar(data['message'] ?? "Error  Data");
    }
  }

  // OrderStatusModel?orderStatusResponse;
  // getStatusOrders()async{
  //   emit(LoadingState());
  //   Response? response = await DioHelper.get("orders-status");
  //   final data = response!.data;
  //   print(data);
  //   if (response.statusCode==200) {
  //     orderStatusResponse= OrderStatusModel.fromJson(data);
  //     emit(SuccessState());
  //   } else {
  //     emit(ErrorState());
  //     Utils.showSnackBar(data['message'] ?? "Error  Data");
  //   }
  // }

  getPastOrders(status) async {
    emit(LoadingState());
    var page = 1;
    Response? response =
        await DioHelper.get("old/orders?page=$page&status=$status");
    final data = response!.data;
    print(data);
    if (response.statusCode == 200) {
      pastorderResponse = OrderModel.fromJson(data);
      print(pastorderResponse!.data!.items.toString());
      emit(SuccessState());
    } else {
      emit(ErrorState());
      Utils.showSnackBar(data['message'] ?? "Error  Data");
    }
  }

  postCancelOrders(id) async {
    final body = {"reason": "ff t tew tewt ewt wetwet"};
    emit(LoadingState());
    Response? response =
        await DioHelper.post("order/$id/cancel", true, body: body);
    final data = response.data;
    print(data);
    if (data["status"] == 200) {
      orderResponse = OrderModel.fromJson(data);
      print(orderResponse!.data.toString());
      emit(SuccessState());
    } else {
      emit(ErrorState());
      print(data["message"]);
      // Utils.showSnackBar(data['message'] ?? "Error  Data");
    }
  }
}
