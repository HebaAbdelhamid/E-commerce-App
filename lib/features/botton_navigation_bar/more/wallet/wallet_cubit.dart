import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/models/walletModel.dart';

import 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(InitialWalletState());
  WalletModel?walletResponse;
  fetch()async{
   Response ?response=await DioHelper.get("wallet");
   final data =response!.data as Map<String,dynamic>;
   if(data["status"]==true){
     emit(LoadingWalletState());
     walletResponse=WalletModel.fromJson(data);
     emit(SuccessWalletState());
   }

  }
}
