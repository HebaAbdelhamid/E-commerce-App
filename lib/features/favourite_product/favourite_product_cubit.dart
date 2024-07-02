import 'package:bloc/bloc.dart';

import 'favourite_product_state.dart';

class FavouriteProductCubit extends Cubit<FavouriteProductState> {
  FavouriteProductCubit() : super(FavouriteProductState().init());
}
