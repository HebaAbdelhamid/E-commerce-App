import 'package:bloc/bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());
  bool selected=true;
  selectedIcon(){
    selected=!selected;
    emit(SelectedState());
  }
  bool select=false;
  selectedIcon_(){
    select=!select;
    emit(SelectedState());
  }
  int count=1;
  increament(){
    count=count+1;
    emit(SelectedState());
  }
  decreament(){
    count=count-1;
    emit(SelectedState());
  }

}
