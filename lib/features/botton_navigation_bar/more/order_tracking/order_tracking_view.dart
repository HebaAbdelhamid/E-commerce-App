import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/common_component/BottonSheet/RatingPage.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/more/components/customHeader.dart';

import 'order_tracking_cubit.dart';
import 'order_tracking_state.dart';

class OrderTrackingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => OrderTrackingCubit(),
        child: Scaffold(
            backgroundColor: Colors.white,
            body: BlocBuilder<OrderTrackingCubit, OrderTrackingState>(
              builder: (context, state) {
                final cubit = BlocProvider.of<OrderTrackingCubit>(context);
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      CustomHeader(),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Order Tracking".tr(),
                        style: TextStyle(
                            color: AppStyle.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Text(
                        "Track your order step by step".tr(),
                        style: TextStyle(
                            color: Color(0XFFA2A2A3),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(.3),
                      ),
                      Image.asset(
                        "assets/images/Group 4421.png",
                        height: MediaQuery.of(context).size.height * .25,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 28.0, horizontal: 20),
                        child: AnotherStepper(
                          stepperList: cubit.stepperData,
                          stepperDirection: Axis.vertical,
                          iconWidth: 40,
                          iconHeight: 40,
                          activeBarColor: AppStyle.primaryColor,
                          inActiveBarColor: Colors.grey,
                          inverted: false,
                          verticalGap: 30,
                          activeIndex: cubit.activeStep,
                          barThickness: 4,
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                    ],
                  ),
                );
              },
            )));
  }
}
