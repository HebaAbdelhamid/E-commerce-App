import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yiki1/features/botton_navigation_bar/catrgories/catrgories_view.dart';
import 'package:yiki1/features/botton_navigation_bar/home/home_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/more_view.dart';

import 'botton_navigation_bar_state.dart';
import 'cart/cart_view.dart';

class BottonNavigationBarCubit extends Cubit<BottonNavigationBarState> {
  BottonNavigationBarCubit({this.currentIndex = 0}) : super(InitialState());
  List<Widget> pages = [HomePage(), CatrgoriesPage(), CartPage(), MorePage()];
  int currentIndex;

  currentIndexs(index) {
    currentIndex = index;
    emit(UpdateState());
  }

  currentIndex_(index) {
    currentIndex = index;
    emit(UpdateState());
  }
}
