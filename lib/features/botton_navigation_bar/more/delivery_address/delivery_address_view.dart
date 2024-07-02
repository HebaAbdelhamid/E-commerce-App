import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yiki1/common_component/CstomOrderPlace.dart';
import 'package:yiki1/common_component/authentication_header.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/google_map/google_map_view.dart';

import '../../cart/complete_order/complete_order_cubit.dart';
import '../../cart/complete_order/complete_order_state.dart';
import '../../cart/complete_order/component/choose_address_step.dart';

//Delivery_addressPage

class Delivery_addressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CompleteOrderCubit(),
        child: Scaffold(body: SafeArea(child:
            BlocBuilder<CompleteOrderCubit, CompleteOrderState>(
                builder: (context, state) {
          final cubit = BlocProvider.of<CompleteOrderCubit>(context);
          return ListView(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAuthenticationHeader(),
                  SizedBox(
                    height: 10,
                  ),
                   Text(
                    "Delivery Addresses".tr(),
                    style: TextStyle(
                        color: AppStyle.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                   Text(
                    "Your Delivery Addresses list.".tr(),
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
                  SizedBox(height: 320, child: CustomAddress(cubit: cubit)),
                  SizedBox(
                    height: 17,
                  ),
                  CustomButton(
                    title: "Add New Address".tr(),
                    function: () { cubit.changeStep(index: 1);
                      MagicRouter.navigateTo(GoogleMapPage());
                      },
                    bgColor: AppStyle.primaryColor,
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
          ]);
        }))));
  }
}
