import 'package:bloc/bloc.dart';

import 'favourite_product_state.dart';

class FavouriteProductCubit extends Cubit<FlashSalePageState> {
  FavouriteProductCubit() : super(FlashSalePageState().init());
}
