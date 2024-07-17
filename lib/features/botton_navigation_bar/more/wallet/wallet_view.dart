import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yiki1/common_component/BottonSheet/chargeYourWallet.dart';
import 'package:yiki1/common_component/authentication_header.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/more/wallet/wallet_state.dart';

import 'wallet_cubit.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WalletCubit()..fetch(),
      child: BlocBuilder<WalletCubit, WalletState>(
  builder: (context, state) {
    final cubit=BlocProvider.of<WalletCubit>(context);
    return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
            child: ListView(children:  [
              CustomAuthenticationHeader(),
              SizedBox(height: 10),
              Column(
                children: [
                  Text(
                    "My Wallet".tr(),
                    style: TextStyle(
                        color: AppStyle.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    " Follow your wallet balance".tr(),
                    style: TextStyle(
                        color: Color(0XFFA2A2A3),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SvgPicture.asset("assets/images/wallet (1).svg"),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*.23,
                    decoration: BoxDecoration(color: Colors.grey.withOpacity(.2),borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Current Balance".tr(),
                          style: TextStyle(
                              color: Color(0XFFA2A2A3),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        //
                        SizedBox(
                          height: 13,
                        ),
                        Text(
                          " ${cubit.walletResponse!.data!.wallet}",
                          style: TextStyle(
                            color: AppStyle.blackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 23
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40
                  ),
                  CustomButton(
                    bgColor: AppStyle.primaryColor,
                    textColor: Colors.white,
                    title: 'Charge your wallet'.tr(),
                    function: () {
                      showModalBottomSheet(context: context, builder: (context){
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Chargeyourwallet(),
                        );
                      });
                      // cubit.login();
                      // Utils.showSnackBar(context, cubit.login());
                     // MagicRouter.navigateTo(BottonNavigationBarPage());
                    },
                  ),
                ],
              )



            ]),
          ));
  },
)
    );
  }


}


