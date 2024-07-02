import 'package:bloc/bloc.dart';

import 'sign_out_state.dart';

class Sign_outCubit extends Cubit<Sign_outState> {
  Sign_outCubit() : super(Sign_outState().init());
}
