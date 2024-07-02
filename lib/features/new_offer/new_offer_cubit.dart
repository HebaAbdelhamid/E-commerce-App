import 'package:bloc/bloc.dart';

import 'new_offer_state.dart';

class NewOfferCubit extends Cubit<NewOfferState> {
  NewOfferCubit() : super(NewOfferState().init());
  void selectValue(String? value) {
    emit(state.copyWith(selectedValue: value));

  }
}
