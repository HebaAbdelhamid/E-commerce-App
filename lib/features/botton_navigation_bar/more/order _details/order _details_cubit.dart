import 'package:bloc/bloc.dart';

import 'order _details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(InitialSate());
}
