import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/common_component/CartDetails.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/common_component/custom_loading.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/utils/utils.dart';

import '../complete_order_cubit.dart';
import '../complete_order_state.dart';

class CompletePayment extends StatelessWidget {
 
  List paymentMethodTitle = [
    'vodafone cash',
    'instapay',
    'Cash on delivery'
  ];

  CompletePayment(this.gift);

  String ?gift;

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<CompleteOrderCubit, CompleteOrderState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<CompleteOrderCubit>(context);
          return
            state is LoadingState ||cubit.getCartResponse==null?CustomLoading(): Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: () {
                print(
                    "price: ${cubit.getAddressResponse!.data
                        .toString() ?? 1}");
              }, icon: Icon(Icons.abc)),
              Padding(
                padding: EdgeInsets.only(top: 28.0, right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Choose Payment Method",
                      style: TextStyle(
                          fontSize: 17,
                          color: AppStyle.blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 170,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                cubit.selesctedPayment(index);
                                cubit.paymentMethod_(paymentMethodTitle[index]);
                              },
                              child: CustomListTilePayment(
                                image: cubit.selectedPayment == index
                                    ? 'Group 4211.png'
                                    : 'images.png',
                                title: paymentMethodTitle[index],
                              )
                          );
                        }, itemCount: 3,
                      ),
                    ),
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
                            controller: cubit.copoun,
                            radius: 5,
                            isNext: true,
                            prefixIcon: Padding(
                              padding:
                              const EdgeInsets.only(left: 19.0, right: 7),
                              child: Image.asset(
                                  "assets/images/Ticket Sale.png"),
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
                                    child: TextButton(
                                      child: const Text("Apply",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),),
                                      onPressed: () {
                                        cubit.addCouponMethods();
                                      },

                                    )))),
                      ],
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                  ],
                ),
              ),
              state is LoadingState?CustomLoading():
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: AppStyle.primaryColor),
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 18),
                  child: Column(
                    children: [
                      const Text(
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
                        price: "${cubit.getCartResponse!.data!.order!.productsCount
          .toString() ?? 1}",
                      ),
                      CartDetails(
                        titleColor: Colors.grey.withOpacity(.9),
                        title: "Price",
                        priceColor: AppStyle.lightBlack,
                        price: "${cubit.getCartResponse!.data!.order!.subTotal
                            .toString() ?? 1}",
                      ),
                      CartDetails(
                        titleColor: Colors.grey.withOpacity(.9),
                        title: "Discount Coupon Value",
                        priceColor: AppStyle.lightBlack,
                        price: "${cubit.getCartResponse!.data!.order!.grandTotalAfterDeposit
                            .toString() ?? 1}",
                      ),
                      CartDetails(
                        titleColor: Colors.grey.withOpacity(.9),
                        title: "Tax",
                        priceColor: AppStyle.lightBlack,
                        price: "${cubit.getCartResponse!.data!.order!.couponValue
                            .toString() ?? 1}",
                      ),
                      CartDetails(
                        titleColor: Colors.grey.withOpacity(.9),
                        title: "shipping fees",
                        priceColor: AppStyle.lightBlack,
                        price: "${cubit.getCartResponse!.data!.order!.tex
                            .toString() ?? 1}",
                      ),
                      CartDetails(
                        titleColor: AppStyle.primaryColor,
                        title: "Total Price",
                        priceColor: AppStyle.primaryColor,
                        price: "${cubit.getCartResponse!.data!.order!.grandTotalAfterDeposit
                            .toString() ?? 1}",
                      ),
                      SizedBox(
                          height: 17
                      ),
                      CustomButton(
                        bgColor: AppStyle.primaryColor,
                        textColor: Colors.white,
                        title: "Checkout",
                        function: () {
                          // final cubit_ = BlocProvider.of<CartCubit>(context);
                          // print(cubit_.gift);
                          // print("==========${cubit.paymentMethod}");
                          cubit.addPaymentMethods(
                              "20", cubit.paymentMethod, gift);
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
