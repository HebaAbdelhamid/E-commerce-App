import 'package:bloc/bloc.dart';
import 'package:yiki1/features/auth/pin_code/pincode_state.dart';


class PincodeCubit extends Cubit<PincodeState> {
  PincodeCubit() : super(PincodeState().init());
}
