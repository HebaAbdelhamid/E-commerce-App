import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/addToCartModel.dart';
import 'package:yiki1/core/models/home_model.dart';
import 'package:yiki1/utils/utils.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());
  bool selected = true;

  selectedIcon() {
    selected = !selected;
    emit(SelectedState());
  }

  bool select = false;

  selectedIcon_() {
    select = !select;
    emit(SelectedState());
  }

  int count = 1;

  increament() {
    count = count + 1;
    emit(SelectedState());
  }

  decreament() {
    count = count - 1;
    emit(SelectedState());
  }


  HomeModel? homeResponse;

  Future<void> fetchHome() async {
    emit(LoadingState());
    Response? response = await DioHelper.get("home");
    final data = response!.data;
    if (data["status"] == true) {
      homeResponse = HomeModel.fromJson(data);
      // print(homemodel.data!.banners.toString());

      emit(SuccessState());
    } else {
      emit(ErrorState());
      Utils.showSnackBar(data['message'] ?? "Error  Data");
    }
  }

  AddtoCartModel? addtoCartResponse;

  addToCart({required String id}) async {
    final body = {"id": id, "quantity": count, "all_quantity": "1"};
    Response response = await DioHelper.post("add-to-cart", true, body: body);
    final data = response.data as Map<String, dynamic>;
    print("=======");
    if (data["status"] == true) {
      print("=======");
      addtoCartResponse = AddtoCartModel.fromJson(data);
      emit(SuccessState_());
    } else {
      emit(ErrorState_());
      Utils.showSnackBar(data["message"] ?? "Error");
    }
  }
}
