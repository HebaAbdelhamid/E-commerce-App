import 'package:bloc/bloc.dart';

import 'discount_counpons_state.dart';

class Discount_counponsCubit extends Cubit<Discount_counponsState> {
  Discount_counponsCubit() : super(Discount_counponsState().init());
}
