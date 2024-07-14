import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/orderDetailsModel.dart';
import 'package:yiki1/core/models/orderModel.dart';
import 'package:yiki1/core/models/return%20OrderModel.dart';
import 'package:yiki1/utils/utils.dart';

import 'return_orders_state.dart';

class ReturnOrdersCubit extends Cubit<ReturnOrdersState> {
  ReturnOrdersCubit() : super(InitialState());

  ReturnOrderModel? returnOrderResponse;
  getReturnOrders() async {
    emit(LoadingState());
    var page = 1;
    Response? response =
    await DioHelper.get("returns?page=$page");
    final data = response!.data;
    print(data);
    if (response.statusCode == 200) {
      returnOrderResponse = ReturnOrderModel.fromJson(data);
      emit(SuccessState());
    } else {
      emit(ErrorState());
      Utils.showSnackBar(data['message'] ?? "Error  Data");
    }
  }
}
