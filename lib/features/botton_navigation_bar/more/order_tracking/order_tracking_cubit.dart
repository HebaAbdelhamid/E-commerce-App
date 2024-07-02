import 'package:another_stepper/another_stepper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yiki1/core/styles.dart';

import 'order_tracking_state.dart';

class OrderTrackingCubit extends Cubit<OrderTrackingState> {
  OrderTrackingCubit() : super(InitialState());
  List<StepperData> stepperData = [
    StepperData(
      title: StepperText(
        "In Review",
        textStyle: TextStyle(
            color: AppStyle.lightBlack,
            fontWeight: FontWeight.bold,
            fontSize: 11),
      ),
      subtitle:StepperText(
      "Your order in review now",
      textStyle: TextStyle(
  color: AppStyle.lightBlack,
  fontWeight: FontWeight.bold,
  fontSize: 11),
  ) ,
      iconWidget: SvgPicture.asset(
        "assets/images/Group 4182 (1).svg",
        fit: BoxFit.cover,color: Colors.grey,
      ),
    ),
    StepperData(
      iconWidget: SvgPicture.asset(
        "assets/images/Group 4187.svg",
        fit: BoxFit.cover,color: Colors.grey,
      ),
      title: StepperText(
        "In Progress",
        textStyle: TextStyle(color: AppStyle.lightBlack, fontSize: 11),
      ),
      subtitle: StepperText(
  "Your order is being prepared now",
  textStyle: TextStyle(color: AppStyle.lightBlack, fontSize: 11),
  ),


    ),//Group 4187
    StepperData(
      title: StepperText(
        "shipped",
        textStyle: TextStyle(color: AppStyle.lightBlack, fontSize: 11),
      ),
      subtitle: StepperText(
        "Your order in the way now",
        textStyle: TextStyle(color: AppStyle.lightBlack, fontSize: 11),
      ),
      iconWidget: SvgPicture.asset(
        "assets/images/Group 4188.svg",color: Colors.grey,
        fit: BoxFit.cover,
      ),
//Group 4191
    ), StepperData(
      title: StepperText(
        "Delivered",
        textStyle: TextStyle(color: AppStyle.lightBlack, fontSize: 11),
      ),
      subtitle: StepperText(
        "Your order has been delivered, rate your experince",
        textStyle: TextStyle(color: AppStyle.lightBlack, fontSize: 11),
      ),
      iconWidget: SvgPicture.asset(
        "assets/images/Group 4191.svg",color: Colors.grey,
        fit: BoxFit.cover,
      ),

    ),

  ];
  int activeStep = 1;

  changeStep({required int index}) {
    activeStep = index;
    emit(ChangeStepState());
  }
}
