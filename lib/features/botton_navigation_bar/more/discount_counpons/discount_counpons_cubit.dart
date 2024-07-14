import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/get.CouponModel.dart';
import 'package:yiki1/utils/utils.dart';
import 'discount_counpons_state.dart';

class Discount_counponsCubit extends Cubit<Discount_counponsState> {
  Discount_counponsCubit() : super(InitialState());
  CouponModel? couponResponse;

  Future<void> fetchCoupon() async {
    final body={
      "code":"coupon2"
    };
    emit(LoadingState());
    Response? response = await DioHelper.get("coupons",body: body);
    final data = response!.data;
    print("${data.toString()}");
    if (response.statusCode == 200) {
      couponResponse = CouponModel.fromJson(data);
      print(couponResponse!.data!.items![0].code);

      emit(SuccessState());
    } else {
      emit(ErrorState());
      Utils.showSnackBar(data['message'] ?? "Error  Data");
    }
  }
}
