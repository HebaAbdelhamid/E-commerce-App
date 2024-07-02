import 'package:bloc/bloc.dart';

import 'my_order_state.dart';

class MyOrderCubit extends Cubit<MyOrderState> {
  MyOrderCubit() : super(InitialState());
  int selected=1;
  selected_(int index){
    selected=index;
    emit(SelectedState());
  }
}
