import 'package:bloc/bloc.dart';

import 'return_order_reason_state.dart';

class ReturnOrderReasonCubit extends Cubit<ReturnOrderReasonState> {
  ReturnOrderReasonCubit() : super(ReturnOrderReasonState().init());
}
