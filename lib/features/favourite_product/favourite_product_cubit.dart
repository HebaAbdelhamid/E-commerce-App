import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/addToCartModel.dart';
import 'package:yiki1/core/models/getFavouriteModel.dart';
import 'package:yiki1/utils/utils.dart';

import 'favourite_product_state.dart';

class FavouriteProductCubit extends Cubit<FavouriteProductState> {
  FavouriteProductCubit() : super(InitialState());
  GetFavouriteModel?getFavouriteResponse;
  fetchFavouriteProduct()async{
    emit(LoadingState());
    Response? response=await DioHelper.get("products/favourites");
    final data=response!.data as Map<String,dynamic>;
    if(data["status"]==true){
      getFavouriteResponse=GetFavouriteModel.fromJson(data);
      print(getFavouriteResponse!.data!.products![0].name);
      emit(SuccessState());

    }else{
      emit(ErrorState());
      print(data["message"]??"Error");
      Utils.showSnackBar(data['message'] ?? "Error  Data");

    }
  }
  Map<int, int> itemCounts = {};

  increament(int itemId ) {
    itemCounts[itemId] = (itemCounts[itemId] ?? 0) + 1;
    emit(SelectState());
  }

  decreament(int itemId) {
    itemCounts[itemId] = itemCounts[itemId]! - 1;
    emit(SelectState());
  }
  int getItemCount(int itemId) {
    return itemCounts[itemId] ?? 1;
  }

  AddtoCartModel? addtoCartResponse;
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

      emit(SuccessState());
    } else {
      emit(ErrorState());
      Utils.showSnackBar(data["message"] ?? "Error");
    }
  }





}
