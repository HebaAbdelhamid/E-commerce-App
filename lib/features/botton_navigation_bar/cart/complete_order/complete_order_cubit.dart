import 'package:another_stepper/another_stepper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yiki1/core/styles.dart';

import 'complete_order_state.dart';

class CompleteOrderCubit extends Cubit<CompleteOrderState> {
  CompleteOrderCubit() : super(CompleteInitState());
  List<StepperData> stepperData = [
    StepperData(
      title: StepperText(
        "Select Delivery Address",
        textStyle: TextStyle(
            color: AppStyle.lightBlack,
            fontWeight: FontWeight.bold,
            fontSize: 11),
      ),
      iconWidget: SvgPicture.asset(
        "assets/images/Group 7364.svg",
        fit: BoxFit.cover,
      ),
    ),
    StepperData(
      title: StepperText(
        "Complete Payment",
        textStyle: TextStyle(color: AppStyle.lightBlack, fontSize: 11),
      ),
      iconWidget: SvgPicture.asset(
        "assets/images/Vector (Stroke)1.svg",
        fit: BoxFit.cover,
      ),
    )
  ];
  int activeStep = 0;

  changeStep({required int index}) {
    activeStep = index;
    emit(ChangeStepState());
  }
  int selected =0;
  selesctedContainer(int index){
    selected=index;
    emit(SelectedContainer());

  }
  int selectedPayment =0;
  selesctedPayment(int index){
    selectedPayment=index;
    emit(SelectedPaymentMethod());

  }
}
