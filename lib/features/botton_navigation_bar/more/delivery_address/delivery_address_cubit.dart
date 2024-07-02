import 'package:bloc/bloc.dart';

import 'delivery_address_state.dart';

class Delivery_addressCubit extends Cubit<Delivery_addressState> {
  Delivery_addressCubit() : super(Delivery_addressState().init());
}
