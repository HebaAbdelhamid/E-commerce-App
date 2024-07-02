import 'package:bloc/bloc.dart';

import 'shared_applicaton_state.dart';

class Shared_applicatonCubit extends Cubit<Shared_applicatonState> {
  Shared_applicatonCubit() : super(Shared_applicatonState().init());
}
