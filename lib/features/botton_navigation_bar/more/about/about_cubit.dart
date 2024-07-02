import 'package:bloc/bloc.dart';

import 'about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit() : super(AboutState().init());
}
