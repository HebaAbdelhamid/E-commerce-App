import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yiki1/common_component/authentication_header.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';

import 'complete_order_cubit.dart';
import 'complete_order_state.dart';
import 'component/choose_address_step.dart';
import 'component/complete_payment.dart';

class ChooseAddressPage extends StatelessWidget {
  ChooseAddressPage(this. gift);
  String? gift;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CompleteOrderCubit()..getAddress(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: Container(
              width: 60,
              height: 35,
              decoration: BoxDecoration(
                color: AppStyle.lightGrayColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: AppStyle.blackColor,
                ),
                onPressed:  () {
                  MagicRouter.pop();

                },
              ),
            ),
            actions: [
              SvgPicture.asset("assets/images/Group 1000000927.svg")
            ],
          ),
            body: SafeArea(child:
            BlocBuilder<CompleteOrderCubit, CompleteOrderState>(
                builder: (context, state) {
          final controller = BlocProvider.of<CompleteOrderCubit>(context);
          return ListView(children: [
            Padding(
              padding: EdgeInsets.only(top: 28.0, right: 20,left: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Select Delivery Address",
                    style: TextStyle(
                        color: AppStyle.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  const Text(
                    "Choose the address you want your order to be delivered to.",
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
                  AnotherStepper(
                    stepperList: controller.stepperData,
                    stepperDirection: Axis.horizontal,
                    iconWidth: 40,
                    iconHeight: 40,
                    activeBarColor: AppStyle.primaryColor,
                    inActiveBarColor: Colors.grey,
                    inverted: true,
                    verticalGap: 30,
                    activeIndex: controller.activeStep,
                    barThickness: 4,
                  ),
                ],
              ),
            ),
            controller.activeStep == 0
                ? ChooseAddressStep()
                : CompletePayment(gift),
            SizedBox(
              height: 17,
            ),
          ]);
        }))));
  }
}
