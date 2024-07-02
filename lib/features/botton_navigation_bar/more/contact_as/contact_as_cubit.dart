import 'package:bloc/bloc.dart';

import 'contact_as_state.dart';

class Contact_asCubit extends Cubit<Contact_asState> {
  Contact_asCubit() : super(Contact_asState().init());
}
