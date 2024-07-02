import 'package:bloc/bloc.dart';

import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryState().init());
  void selected(value){
    value=true;
  }
}
