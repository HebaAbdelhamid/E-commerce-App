import 'package:bloc/bloc.dart';

import 'account_setting_state.dart';

class Account_settingCubit extends Cubit<Account_settingState> {
  Account_settingCubit() : super(Account_settingState().init());
}
