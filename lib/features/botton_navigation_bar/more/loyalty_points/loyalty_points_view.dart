import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yiki1/common_component/BottonSheet/loyaltyPoints.dart';
import 'package:yiki1/common_component/authentication_header.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/core/styles.dart';

import 'loyalty_points_cubit.dart';
import 'loyalty_points_state.dart';

class LoyaltyPointsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoyaltyPointsCubit(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
            child: ListView(children:  [
              CustomAuthenticationHeader(),
              SizedBox(height: 10),
              Column(
                children: [
                  Text(
                    "Loyalty Points".tr(),
                    style: const TextStyle(
                        color: AppStyle.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    " Follow & Control Your Loyalty Points ".tr(),
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
                              fontSize: 19),
                        ),
                        //
                        SizedBox(
                          height: 13,
                        ),
                        Text(
                          " 10000",
                          style: TextStyle(
                              color: AppStyle.blackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Text(
                          "Loyalty point".tr(),
                          style: TextStyle(
                              color: AppStyle.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Text(
                          "Every 1,000 loyalty points = 10 EGP",
                          style: TextStyle(
                              color: Color(0XFFA2A2A3),
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    bgColor: AppStyle.primaryColor,
                    textColor: Colors.white,
                    title: 'Convert loyalty points into wallet balance'.tr(),
                    function: () {
                      showModalBottomSheet(context: context, builder: (context){
                        return Loyaltypoints();
                      });
                      // cubit.login();
                      // Utils.showSnackBar(context, cubit.login());
                      // MagicRouter.navigateTo(BottonNavigationBarPage());
                    },
                  ),
                ],
              )



            ]),
          ))
    );
  }


}


