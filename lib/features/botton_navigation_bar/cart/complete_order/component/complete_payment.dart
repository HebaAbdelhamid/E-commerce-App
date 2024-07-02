import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/common_component/CartDetails.dart';
import 'package:yiki1/common_component/Custom_sub_header_home.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/common_component/pop_up.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/utils/utils.dart';

import '../complete_order_cubit.dart';
import '../complete_order_state.dart';

class CompletePayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompleteOrderCubit, CompleteOrderState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<CompleteOrderCubit>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Choose Payment Method",
                    style: TextStyle(
                        fontSize: 17,
                        color: AppStyle.blackColor,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                      onTap: () {
                        cubit.selesctedPayment(0);
                      },
                      child: CustomListTilePayment(
                        image: cubit.selectedPayment == 0
                            ? 'Group 4211.png'
                            : 'images.png',
                        title: 'vodafone cash',
                      )),
                  InkWell(
                      onTap: () {
                        cubit.selesctedPayment(1);
                      },
                      child: CustomListTilePayment(
                        image: cubit.selectedPayment == 1
                            ? 'Group 4211.png'
                            : 'images.png',
                        title: 'instapay',
                      )),
                  InkWell(
                      onTap: () {
                        cubit.selesctedPayment(2);
                      },
                      child: CustomListTilePayment(
                        image: cubit.selectedPayment == 2
                            ? 'Group 4211.png'
                            : 'images.png',
                        title: 'Cash on delivery',
                      )),
                  Divider(
                    color: Colors.grey.withOpacity(.4),
                  ),
                  Text("Do you have discount coupon ?",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff252525),
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 11,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomTextField(
                          radius: 5,
                          isNext: true,
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.only(left: 19.0, right: 7),
                            child: Image.asset("assets/images/Ticket Sale.png"),
                          ),
                          hint: 'What are you looking for ?'.tr(),
                          hintColor: AppStyle.greyColor,
                          // controller: controller.email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      Expanded(
                          child: Container(
                              width: 74,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: AppStyle.primaryColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Text(
                                "Apply",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              )))),
                    ],
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                    // left: BorderSide(color: AppStyle.primaryColor),
                    // right: BorderSide(color: AppStyle.primaryColor),
                    top: BorderSide(color: AppStyle.primaryColor),
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
                child: Column(
                  children: [
                    Text(
                      "Order Summary",
                      style: TextStyle(
                          fontSize: 17,
                          color: AppStyle.blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                    CartDetails(
                      titleColor: Colors.grey.withOpacity(.9),
                      title: "No. Of Products",
                      priceColor: AppStyle.lightBlack,
                      price: "7",
                    ),
                    CartDetails(
                      titleColor: Colors.grey.withOpacity(.9),
                      title: "Price",
                      priceColor: AppStyle.lightBlack,
                      price: "810.00",
                    ),
                    CartDetails(
                      titleColor: Colors.grey.withOpacity(.9),
                      title: "Discount Coupon Value",
                      priceColor: AppStyle.lightBlack,
                      price: "100.0",
                    ),
                    CartDetails(
                      titleColor: Colors.grey.withOpacity(.9),
                      title: "Tax",
                      priceColor: AppStyle.lightBlack,
                      price: "32.00",
                    ),
                    CartDetails(
                      titleColor: Colors.grey.withOpacity(.9),
                      title: "shipping fees",
                      priceColor: AppStyle.lightBlack,
                      price: "20.00",
                    ),
                    CartDetails(
                      titleColor: AppStyle.primaryColor,
                      title: "Total Price",
                      priceColor: AppStyle.primaryColor,
                      price: "762.00",
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    CustomButton(
                      bgColor: AppStyle.primaryColor,
                      textColor: Colors.white,
                      title: "Checkout",
                      function: () {
                        Utils.completeOrder(context);
                        // Utils.verifyAccount(context);
                      },
                    ),
                    SizedBox(
                      height: 17,
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class CustomListTilePayment extends StatelessWidget {
  CustomListTilePayment({super.key, required this.image, required this.title});

  String image;
  String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        "assets/images/$image",
        width: 22,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 15,
            color: AppStyle.blackColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
