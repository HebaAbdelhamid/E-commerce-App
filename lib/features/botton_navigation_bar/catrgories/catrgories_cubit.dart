import 'package:bloc/bloc.dart';

import 'catrgories_state.dart';

class CatrgoriesCubit extends Cubit<CatrgoriesState> {
  CatrgoriesCubit() : super(CatrgoriesState().init());
}
