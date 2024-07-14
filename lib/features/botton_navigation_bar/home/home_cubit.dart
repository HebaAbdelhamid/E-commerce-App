import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/addToCartModel.dart';
import 'package:yiki1/core/models/home_model.dart';
import 'package:yiki1/core/models/postFavouriteModel.dart';
import 'package:yiki1/core/models/productDetailsModel.dart';
import 'package:yiki1/utils/utils.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());
  bool selected = true;
  int selectedIndex = 0;
selectedIndex_(index){
selectedIndex=index;
}

  selectedIcon() {
    selected = !selected;
    emit(SelectedState());
  }

  bool select = false;

  selectedIcon_() {
    select = !select;
    emit(SelectedState());
  }
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
  ProductDetailsModel?productDetailsResponse;
  Future<void> fetchProductDetails(id) async {
    emit(LoadingState());
    Response? response = await DioHelper.get("products/$id");
    final data = response!.data;
    if (data["status"] == true) {
      productDetailsResponse = ProductDetailsModel.fromJson(data);
print(productDetailsResponse!.data!.name);
      emit(SuccessState());
    } else {
      emit(ErrorState());
      Utils.showSnackBar(data['message'] ?? "Error  Data");
    }
  }

  AddtoCartModel? addtoCartResponse;
PostFavouriteModel?postFavouriteResponse;
  addToCart({required String id,count}) async {
    final body =
    {"id": id, "quantity": "9", "all_quantity": "0"};
    Response response = await DioHelper.post("add-to-cart", true, body: body);
    final data = response.data as Map<String, dynamic>;
    if (data["status"] == true) {
      print("=======");
      addtoCartResponse = AddtoCartModel.fromJson(data);
      print(addtoCartResponse!.data!.order!.items![0].productName);
      print(addtoCartResponse!.data!.order!.items!.length);

      emit(SuccessState_());
    } else {
      emit(ErrorState_());
      Utils.showSnackBar(data["message"] ?? "Error");
    }
  }
  addToFavourite({required String product_id,}) async {
    final body={};
    // print(product_id);
    Response response = await DioHelper.post("favourite/$product_id",true);
    final data = response.data as Map<String, dynamic>;
    print(response.data);

    if (response.statusCode==200) {
      print("=======");
      postFavouriteResponse = PostFavouriteModel.fromJson(data);
      print(postFavouriteResponse!.data.toString());

      emit(SuccessState_());
    } else {
      emit(ErrorState_());
      print("error");
      print("error");
      Utils.showSnackBar(data["message"] ?? "Error");
    }
  }

}
