import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/addToCartModel.dart';
import 'package:yiki1/core/models/categoryModel.dart';
import 'package:yiki1/core/models/categoryProductModel.dart';
import 'package:yiki1/utils/utils.dart';

import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(InitialCategoryState());
  int selectedIndex = 0;

  changeSelectedIndex(int index) {
    selectedIndex = index;
    emit(ChangeSelectedAddress());
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

      emit(SuccessCategoryState());
    } else {
      emit(SuccessCategoryState());
      Utils.showSnackBar(data["message"] ?? "Error");
    }
  }
  void selected(value){
    value=true;
  }
  CategoryModel ?categoryResponse;
  fetchCategory()async{
    emit(LoadingCategoryNameState());
    Response? response=await DioHelper.get("categories");
    final data=response!.data as Map<String,dynamic>;
    if(data["status"]==true){
      categoryResponse=CategoryModel.fromJson(data);
      print("===========tttttttttt${categoryResponse!.data!.items![0].id}");
      emit(SuccessCategoryState());

    }else{
      emit(ErrorCategoryState());
      print(data["message"]??"Error");
      Utils.showSnackBar(data['message'] ?? "Error  Data");

    }
  }
  CategoryProductModel?categoryProductResponse;
  fetchCategoryProduct({category_id})async{
    emit(LoadingCategoryState());
    Response? response=await DioHelper.get("products?category_id=$category_id");
    final data=response!.data as Map<String,dynamic>;
    print('data["status"] ${data["status"]}');
    if(data["status"] == true){
      emit(SuccessCategoryState());
      categoryProductResponse=CategoryProductModel.fromJson(data);
    }else {
      print('status not true');
      emit(ErrorCategoryState());
      Utils.showSnackBar(data['message'] ?? "Error  Data");
    }
  }

}
