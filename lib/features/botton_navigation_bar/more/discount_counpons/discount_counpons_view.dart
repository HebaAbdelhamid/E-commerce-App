import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/common_component/authentication_header.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/more/discount_counpons/components/customItem.dart';

import 'discount_counpons_cubit.dart';
import 'discount_counpons_state.dart';

class Discount_counponsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => Discount_counponsCubit(),
        child: Scaffold(
          backgroundColor: Colors.white,
            body: Padding(
          padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
          child: ListView(children: [
            CustomAuthenticationHeader(),
            SizedBox(
              height: 10,
            ),
             Text(
              "Discount Coupons".tr(),
              style: TextStyle(
                  color: AppStyle.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 13,
            ),
             Text(
              " Use discount coupons and get discounts on your purchases.".tr(),
              style: TextStyle(
                  color: Color(0XFFA2A2A3),
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            Divider(
              color: AppStyle.primaryColor,
              thickness: 2,
            ),
            SizedBox(
              height: 13,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.separated(itemBuilder: (context,index){
                return  CustomItem();
              }, separatorBuilder: (context,index){
                return SizedBox(height: 7,);
              }, itemCount: 11),
            )

          ]),
        )));
  }
}

